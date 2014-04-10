module TramlinesPicnicAuth::SessionsControllerExtensions

  def self.included(klass)
    #klass.alias_method_chain :auth_create, :picnic
  end
  
  # def auth_create_with_picnic
  #   auth = request.env["omniauth.auth"]
  #   @member = Member.find_or_initialize_with_omniauth(auth)
  #   login_member!(@member, :redirect => false) if !@member.new_record?
  #   if @member.email.blank?
  #     render :template => "sessions/register_email"
  #   elsif @member.what_i_bring.blank?
  #     render :template => "members/what_i_bring"
  #   else
  #     @member.save!
  #     login_member!(@member)
  #   end
  # end
  
  def create_fb
    if current_facebook_user
      current_facebook_user.fetch
      if logged_in_member
        logged_in_member.update_attribute(:fb_user_id, current_facebook_user.id)
        redirect_to logged_in_member
      else
        @member = Member.find_or_initialize_with_facebook(current_facebook_user)
        conference_delegate = ConferenceDelegate.find_by_signature(params[:signature]) if !params[:signature].blank?
        if @member.new_record?
          @member.conference_delegate = conference_delegate
          @member.auth_service = 'Facebook'
          render :template => "sessions/register_email"
        else
          if conference_delegate && conference_delegate.member.nil? && @member.conference_delegate.nil?
            conference_delegate.update_attribute(:member, @member)
          end
          login_member!(@member)
        end
      end
    else
      redirect_to new_session_path
    end
  end
  
  
end
  