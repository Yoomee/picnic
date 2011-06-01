SessionsController.class_eval do
  
  skip_before_filter :check_what_i_bring, :only => %w{destroy}
  
  def create
    if @logged_in_member
      if params[:signature]
        conference_delegate = ConferenceDelegate.find_by_signature(params[:signature])
        if conference_delegate && conference_delegate.member.nil? && !logged_in_member.conference_delegate.nil?
          conference_delegate.update_attribute(:member, logged_in_member)
          flash[:notice] = "Thanks for verifying your PICNIC 11 booking."
        else
          flash[:notice] = "You've already verified your PICNIC 11 booking."
        end
      end
      login_member!(@logged_in_member)
    else
      #flash[:error] = "Login details not found. Please try again."
      set_login_redirect_message("Login details not found. Please try again.")
      render :action => 'new'
    end
  end
  
end