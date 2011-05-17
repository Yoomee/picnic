MembersController.class_eval do
  
  open_action :show

  skip_before_filter :check_what_i_bring, :only => %w{update what_i_bring}

  def create
    puts "IN CREATE"
    @member = Member.new(params[:member])
    if @member.save
      if params[:in_popup]
        render(:text => "<script type='text/javascript'>window.close()</script>")
      else
        flash[:notice] = "Your account has been created. Welcome to #{APP_CONFIG['site_name']}."
        session[:logged_in_member_id] = @member.id if @logged_in_member.nil?
        redirect_to @member
      end
    else
      render :action => 'new'
    end
  end

  def new_with_redirect
    if logged_in_member
      login_member!(logged_in_member)
    else
      new_without_redirect
    end
  end
  alias_method_chain :new, :redirect

  def update
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
        ajax_update_response(@member, params[:wants])
      end
      format.text do
        ajax_update_response(@member, params[:wants])
      end
    end
  end



  def what_i_bring
    @member = logged_in_member
  end

end