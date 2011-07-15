BadgesController.class_eval do
  
  def show
    @badge = Badge.find(params[:id])
    @badge_members = @badge.members.paginate(:page => params[:page], :per_page => 300, :order => "forename ASC")
  end
  
end