module TramlinesPicnicAuth::MembersControllerExtensions

  def self.included(klass)
    klass.alias_method_chain :create, :picnic
    klass.alias_method_chain :me, :picnic
  end
  
  def create_with_picnic
    in_popup = Module.value_to_boolean(params[:in_popup])
    @member = Member.new(params[:member])
    @member.possible_answers = session[:possible_answers] if !@member.auth_connected? && !logged_in_member_is_admin?
    @member.generate_random_password(true) if logged_in_member_is_admin?
    @member.what_i_bring = '...' if logged_in_member_is_admin? && @member.what_i_bring.blank?
    if @member.save
      if logged_in_member_is_admin?
        flash[:notice] = "#{@template.link_to_self(@member)}'s account has been created."
        redirect_to_waypoint
      else
        session[:logged_in_member_id] = @member.id if @logged_in_member.nil?
        if in_popup
          render(:text => "<script type='text/javascript'>window.close()</script>")
        else
          flash[:notice] = "Your account has been created. Welcome to #{APP_CONFIG['site_name']}."
          redirect_to @member
        end
      end
    elsif @member.auth_connected? && !logged_in_member_is_admin?
      session[:auth_data] = nil
      case @member.auth_service
      when 'Facebook'
        session[:auth_data] = {:auth_service => 'Facebook', :auth_id => @member.fb_user_id}
      when 'Twitter'
        session[:auth_data] = {:auth_service => 'Twitter', :auth_id => @member.twitter_id, :auth_username => @member.twitter_username, :auth_token => @member.twitter_token, :auth_secret => @member.twitter_secret}
      when 'LinkedIn'
        session[:auth_data] = {:auth_service => 'LinkedIn', :auth_id => @member.linked_in_user_id, :auth_token => @member.linked_in_token, :auth_secret => @member.linked_in_secret}
      end
      @existing_member = Member.find_by_email(@member.email)
      render :template => 'sessions/register_email', :layout => (in_popup ? 'auth_popup' : 'application')
    else
      spamify(@member)
      render :action => logged_in_member_is_admin?  ? 'new_by_admin' : 'new'
    end
  end
  
  def me_with_picnic
    if logged_in_member
      if params[:signature]
        conference_delegate = ConferenceDelegate.find_by_signature(params[:signature])
        if conference_delegate && conference_delegate.member.nil? && logged_in_member.conference_delegate.nil?
          conference_delegate.update_attribute(:member, logged_in_member)
          flash[:notice] = "Thanks for verifying your PICNIC 11 booking."
        else
          flash[:notice] = "You've already verified your PICNIC 11 booking."
        end
        redirect_to club_path
      else
        flash[:notice] = "Welcome back #{@logged_in_member.forename}! Thanks for logging in again." if Module.value_to_boolean(params[:login])
        redirect_to logged_in_member
      end
    else
      redirect_to home_path
    end
  end

end