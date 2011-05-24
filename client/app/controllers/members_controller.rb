MembersController.class_eval do
  
  open_action :show

  skip_before_filter :check_what_i_bring, :only => %w{update what_i_bring}

  # def create
  #   puts "IN CREATE"
  #   @member = Member.new(params[:member])
  #   if @member.save
  #     if params[:in_popup]
  #       render(:text => "<script type='text/javascript'>window.close()</script>")
  #     else
  #       flash[:notice] = "Your account has been created. Welcome to #{APP_CONFIG['site_name']}."
  #       session[:logged_in_member_id] = @member.id if @logged_in_member.nil?
  #       redirect_to @member
  #     end
  #   else
  #     render :action => 'new'
  #   end
  # end

  def change_password_with_picnic
    @member.skip_what_i_bring_validation = true
    change_password_without_picnic
  end
  alias_method_chain :change_password, :picnic

  def new_with_redirect
    if logged_in_member && !logged_in_member_is_admin?
      login_member!(logged_in_member)
    else
      new_without_redirect
    end
  end
  alias_method_chain :new, :redirect

  def show_with_shout_filtering
    if request.xhr? && params[:wants] == 'shouts'
      filter = params[:filter]
      shouts = case filter
      when 'popular'
        @member.recipientless_shouts.top_rated
      when 'latest'
        @member.recipientless_shouts
      when 'received'
        @member.received_shouts
      end
      if shouts.empty?
        render :text => (filter == 'received' ? @template.not_received_yet_message(@member) : @template.not_posted_yet_message(@member))
      else
        render :text => @template.render_shouts(shouts)
      end
    else
      show_without_shout_filtering
    end
  end
  alias_method_chain :show, :shout_filtering

  def update
    params[:member] ||= {}
    params[:member][:tag_list] = params[:facelist_values_member_themes] if !params[:facelist_values_member_themes].nil?
    @member.update_attributes(params[:member])
    respond_to do |format|
      format.html do
        if @member.valid?
          flash[:notice] = "Profile updated"
          redirect_to params[:redirect_to] || @member
        else
          render :action => (params[:member].keys.map(&:to_s) == ['what_i_bring'] ? 'what_i_bring' : 'edit')
        end
      end
      format.js do
        ajax_update_response(@member, params[:wants], params[:sf])
      end
      format.text do
        ajax_update_response(@member, params[:wants], params[:sf])
      end
    end
  end

  def what_i_bring
    @member = logged_in_member
  end

end
