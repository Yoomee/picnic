class ConferenceSessionSweeper < ActionController::Caching::Sweeper
  
  observe ConferenceSession
  
  def after_save(conference_session)
    expire_programme(conference_session)
  end

  def after_destroy(conference_session)
    expire_programme(conference_session)
  end
  
  private
  def expire_programme(conference_session)
    expire_page(:controller => 'programmes', :action => 'show', :conference_id => conference_session.conference_id)
  end

end