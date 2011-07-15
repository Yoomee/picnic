class VenueSweeper < ActionController::Caching::Sweeper
  
  observe Venue
  
  def after_save(venue)
    expire_programme(venue)
  end

  def after_destroy(venue)
    expire_programme(venue)
  end
  
  private
  def expire_programme(venue)
    expire_page(:controller => 'programmes', :action => 'show', :conference_id => venue.conference_id)
  end

end