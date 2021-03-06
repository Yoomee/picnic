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
    expire_fragment("program#{venue.conference_id}")
  end

end