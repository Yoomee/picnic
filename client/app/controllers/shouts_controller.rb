ShoutsController.class_eval do

  def create
    @shout = @logged_in_member.shouts.build(params[:shout])
    if @shout.themes_form_step?
      deal_with_themes
    else
      if params[:shout][:shout_type] == "Photo"
        logger.info "RESPONDING TO PARENT"
        responds_to_parent {deal_with_create}
      else
        deal_with_create
      end
    end
  end

  def destroy
    @shout = Shout.find(params[:id])
    if request.xhr?
      if @shout.destroy
        render :update do |page|
          page["shout_#{@shout.id}"].remove
        end
      end
    else
      @shout.destroy
      flash[:notice] = "Successfully deleted discussion."
      redirect_to_waypoint_after_destroy
    end
  end

  def new
    attributes = (params[:shout] || {}).merge(:tag_list => params[:theme])
    render :partial => "themes_form", :locals => {:shout => Shout.new(attributes)}
  end
  
  # def new
  #   @shout = Shout.new
  # end
  
  private
  def deal_with_create
    render(:update) do |page|
      if @shout.save
        page[:shout_wall].prepend(render_shout(@shout))
        page[:new_shout_form].replace render("shouts/form", :shout => Shout.new(:recipient => @shout.recipient))
        page << "$.fancybox.close();"
        page << "$('.shout_form_submit_loader').hide();"
        page << "FancyboxLoader.loadAll();"
      else
        page[:new_shout_form].replace render("shouts/form", :shout => @shout)
      end
    end
  end
  
  # def deal_with_create
  #   render(:update) do |page|
  #     if @shout.save
  #       # TODO Enable this when google analytics properly added, and themes resolved
  #       #page << track_page_view("/discussions/create/#{@shout.id}")
  #       #url = url_to_tag(Tag.find_by_name(@shout.tag_list.first), :filter => "latest")
  #       # delay the redirect so theres time for google analytics to do its thing
  #       #page << "setTimeout('window.location.href = \"#{url}\";', 200);"
  #       page.redirect_to club_path
  #     else
  #       page[:shout_form].replace render("shouts/form", :shout => @shout)
  #       page << "$.fancybox.resize();"
  #     end
  #     page << refresh_fb_dom
  #   end
  # end

  def deal_with_themes
    puts params.inspect
    @shout.tag_list = params[:facelist_values_themes]
    render :update do |page|
      if @shout.has_valid_tags?
        page[:new_shout_themes].replace render("shouts/form", :shout => @shout)
      else
        page[:new_shout_themes].replace render("shouts/themes_form", :shout => @shout)
      end
      page << "$.fancybox.resize();"
    end
  end

  def deal_with_update
    updated_link = params[:shout][:shout_type]=="Link" && !params[:shout][:link_url].blank? && (params[:shout][:link_url] != @shout.link_url)
    original_tag_list = @shout.tag_list
    render(:update) do |page|
      if @shout.update_attributes(params[:shout])
        if Module.value_to_boolean(params[:in_moderation])
          page["moderation_right_inner"].replace_html(render("content_flags/content_flag", :content_flag => @shout.content_flag))
        elsif (original_tag_list & @shout.tag_list) != original_tag_list
          page.redirect_to url_to_tag(Tag.find_by_name(@shout.tag_list.first), :filter => "latest")
        else
          page["news_feed_item_#{@shout.news_feed_item.id}"].replace(render_news_feed_item(@shout.news_feed_item, :class => "conversation"))
          if updated_link
            page << save_site_info_javascript(@shout.attachable, :image_size => "150x125#")
          end
        end
        page << "$.fancybox.close();"
        page << "FancyboxLoader.loadAll();"
      else
        page[:shout_form].replace render("shouts/form", :shout => @shout)
        page << "$.fancybox.resize();"
      end
      page << refresh_fb_dom
    end
  end
  
end