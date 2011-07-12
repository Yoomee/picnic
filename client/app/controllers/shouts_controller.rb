ShoutsController.class_eval do

  owner_only :remove, :restore

  def create
    @shout = @logged_in_member.shouts.build(params[:shout])
    if @shout.themes_form_step?
      deal_with_themes
    else
      if params[:shout][:shout_type] == "Photo"
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
  
  def edit
    render :partial => "themes_form", :locals => {:shout => Shout.find(params[:id])}
  end
  
  def new
    attributes = (params[:shout] || {}).merge(:tag_list => params[:theme])
    render :partial => "themes_form", :locals => {:shout => Shout.new(attributes)}
  end
  
  def remove
    @shout = Shout.find(params[:id])
    params[:shout] = {:removed_by => @logged_in_member, :removed_at => Time.now}
    deal_with_update
  end

  def restore
    @shout = Shout.find(params[:id])
    params[:shout] = {:removed_by => nil, :removed_at => nil}
    deal_with_update
  end
  
  def older
    @shouts = Shout.get_shouts(params[:filter],@logged_in_member).paginate(:page => params[:page], :per_page => params[:per_page])
    render :update do |page|
      @shouts.each do |shout|
        page.insert_html :bottom, :shout_wall, render_shout(shout, :compact_view => params[:compact_view])
      end
      page << "FB.XFBML.parse();"
      if WillPaginate::ViewHelpers.total_pages_for_collection(@shouts) > params[:page].to_i
        page << "$('#older_shouts_link').attr('onclick', '').unbind('click');"
        page << "$('#older_shouts_link').click(function() {#{remote_function(:url => older_shouts_link_url(:parent => @parent), :method => :get)}; return false;});"
      else
        page[:older_shouts_link].replace("")
      end
    end
  end
  
  def update
    @shout = Shout.find(params[:id])
    if Module.value_to_boolean(params[:shout][:themes_form_step])
      deal_with_themes
    elsif params[:shout][:shout_type] == "Photo"
      responds_to_parent {deal_with_update}
    else
      deal_with_update
    end
  end  
  
  private
  def deal_with_create
    render(:update) do |page|
      if @shout.save
        if @shout.recipient
          # shouts = @shout.recipient.received_shouts
          # page[:shouts_container].replace_html(render_shouts(shouts))
          page << "MemberShouts.received();"
        else
          # shouts = logged_in_member.shouts
          # page[:shouts_container].replace_html(render_shouts(shouts))
          page << "MemberShouts.latest();"
          page << "TagShouts.latest();"
          page << "TagShouts.addProfilePhoto(#{logged_in_member_id}, '#{escape_javascript(@template.tag_people_profile_photo(logged_in_member))}')"
        end
        #page[:shout_wall].prepend(render_shout(@shout))
        page << "$.fancybox.close();"        
        # page[:new_shout_form].replace render("shouts/form", :shout => Shout.new(:recipient => @shout.recipient))
        page << "$('.shout_form_submit_loader').hide();"
        page << "FancyboxLoader.loadAll();"
        page << "$('#no_posts').hide();"
      else
        page[:new_shout_form].replace render("shouts/form", :shout => @shout)
      end
    end
  end
  
  def deal_with_update
    updated_link = params[:shout][:shout_type]=="Link" && !params[:shout][:link_url].blank? && (params[:shout][:link_url] != @shout.link_url)
    render :update do |page|
      if @shout.update_attributes(params[:shout])
        page["shout_#{@shout.id}"].replace(render_shout(@shout))
        if updated_link
          page << save_site_info_javascript(@shout.attachable, :image_size => "150x125#")
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


end
