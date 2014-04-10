module TramlinesShouts::MembersControllerExtensions

  def self.included(klass)
    klass.owner_only(:email_preferences, :save_email_preferences)
  end

  def email_preferences
    @member = Member.find(params[:id])
  end
  
  def save_email_preferences
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:notice] = "Your email preferences have been saved."
      redirect_to_waypoint
    else
      render :action => "preferences"
    end
    
  end
  
end