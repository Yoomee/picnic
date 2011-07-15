class TagSweeper < ActionController::Caching::Sweeper
  
  observe Tag
  
  def after_update(tag)
    expire_programmes(tag)
  end

  def after_destroy(tag)
    expire_programmes(tag)
  end
  
  private
  def expire_programmes(tag)
    ConferenceSession.tagged_with(tag).map(&:conference).uniq.each do |conference|
      expire_fragment("program#{conference.id}")
    end
  end

end