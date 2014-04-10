class ShoutsController < ApplicationController

  admin_only :edit, :update
  member_only :create, :new
  owner_only :destroy

  def create
    @shout = @logged_in_member.shouts.build(params[:shout])
    if request.xhr?
      if @shout.tags_form_step?
        deal_with_tags
      else
        deal_with_create
      end
    elsif params[:shout][:attach_type].in? %w{Photo Document}
      responds_to_parent {deal_with_create}      
    else
      if @shout.save
        flash[:notice] = "Created shout"
        redirect_to @shout
      else
        render :action => "new"
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
      flash[:notice] = "Successfully deleted shout."
      redirect_to_waypoint_after_destroy
    end
  end
  
  # override this in client to use tags_form partial, e.g. vcorp
  def edit
    @shout = Shout.find(params[:id])
    if request.xhr?
      return render(:partial => "form", :locals => {:shout => @shout})
    end      
  end

  def index
    if request.xhr?
      @filter = params[:filter]
      get_shouts
      if @shouts.empty?
        out = @parent.is_a?(Member) ? @template.not_posted_yet_message(@parent) : @template.not_received_yet_message(@parent)
        render :text => @template.content_tag(:div, out, :id => "shout_wall")
      else
        out = @template.render_shouts(@shouts, :filter => @filter, :parent => @parent, :named_scope => params[:named_scope])
        out << @template.javascript_tag(@template.refresh_fb_dom) if site_uses_fb_connect?
        render :text => out
      end
    else
      @shouts = Shout.latest.limit(20)      
    end
  end

  # override this in client to use tags_form partial, e.g. vcorp  
  def new
    @shout = @logged_in_member.shouts.build
  end

  def older
    @shouts = get_shouts.paginate(:page => params[:page], :per_page => params[:per_page])
    render :update do |page|
      @shouts.each do |shout|
        page.insert_html :bottom, :shout_wall, render_shout(shout, :compact_view => params[:compact_view])
      end
      if WillPaginate::ViewHelpers.total_pages_for_collection(@shouts) > params[:page].to_i
        page << "$('#older_shouts_link').attr('onclick', '').unbind('click');"
        page << "$('#older_shouts_link').click(function() {#{remote_function(:url => older_shouts_link_url(:parent => @parent), :method => :get)}; return false;});"
      else
        page[:older_shouts_link].replace("")
      end
    end
  end

  def share
    @shout = Shout.find(params[:id])
    @short_url = ShortUrl::shorten(shout_url(@shout))
    render :layout => false
  end

  def show
    @shout = Shout.find(params[:id])
    @shout.read_notifications!(@logged_in_member) if @logged_in_member && params[:read_notification]
  end
  
  def update
    @shout = Shout.find(params[:id])    
    if request.xhr?
      if Module.value_to_boolean(params[:shout][:tags_form_step])
        deal_with_tags
      else
        deal_with_update
      end
    elsif params[:shout][:attach_type].in? %w{Photo Document}
      responds_to_parent {deal_with_update}
    else
      if @shout.update_attributes(params[:shout])
        flash[:notice] = "Updated shout"
        redirect_to @shout
      else
        render :action => "edit"
      end        
    end
  end
  
  private
  def deal_with_create
    render(:update) do |page|
      if @shout.save
        page[:shout_wall].prepend(render_shout(@shout))
        page[:new_shout_form].replace render("shouts/form", :shout => Shout.new(:recipient => @shout.recipient))
        page << "$('#no_posts').hide();"
        page << "$.fancybox.close(); FancyboxLoader.loadAll();"
      else
        page[:new_shout_form].replace render("shouts/form", :shout => @shout)
      end
    end
  end

  def deal_with_update
    updated_link = params[:shout][:attach_type]=="Link" && !params[:shout][:link_url].blank? && (params[:shout][:link_url] != @shout.link_url)
    render(:update) do |page|
      if @shout.update_attributes(params[:shout])
        page["shout_#{@shout.id}"].replace(render_shout(@shout))
        if updated_link
          page << save_site_info_javascript(@shout.attachable, :image_size => "150x125#")
        end
        page << "$.fancybox.close(); FancyboxLoader.loadAll();"
      else
        page[:edit_shout_form].replace render("shouts/form", :shout => @shout)
        page << "$.fancybox.resize();"
      end
    end
  end

  def deal_with_tags
    @shout.tag_list = params[:facelist_values_tags]
    render :update do |page|
      if @shout.has_valid_tags?
        page[:new_shout_tags].replace render("shouts/form", :shout => @shout)
      else
        page[:new_shout_tags].replace render("shouts/tags_form", :shout => @shout)
      end
      page << "$.fancybox.resize();"
    end
  end

  def get_parent
    @parent = params[:parent_type].constantize.find(params[:parent_id]) if !params[:parent_type].blank? && !params[:parent_id].blank?
  end

  def get_shouts
    get_parent
    if @parent.nil?
      @shouts = params[:named_scope].blank? ? Shout : Shout.send(params[:named_scope])
    else
      @shouts = @parent.is_a?(Member) ? @parent.profile_shouts : @parent.shouts
    end
    if @filter == 'popular'
      @shouts = @shouts.top_rated
    else
      @shouts = @shouts.latest
    end
  end

end
