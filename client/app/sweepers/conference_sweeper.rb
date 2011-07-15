class ConferenceSweeper < ActionController::Caching::Sweeper
  
  observe Conference
  
  def after_save(conference)
    expire_programme(conference)
  end

  def after_destroy(conference)
    expire_programme(conference)
  end
  
  private
  def expire_programme(conference)
    expire_page(:controller => 'programmes', :action => 'show', :conference_id => conference.id)
  end

end