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

  def update
    @member.tag_list = params[:facelist_values_themes] if !params[:facelist_values_themes].blank?
    @member.update_attributes(params[:member])
    respond_to do |format|
      format.html do
        if @member.valid?
          flash[:notice] = "Profile updated"
          redirect_to @member
        else
          puts "keys = " + params[:member].keys.map(&:to_s).inspect
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