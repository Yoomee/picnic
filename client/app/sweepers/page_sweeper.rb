class PageSweeper < ActionController::Caching::Sweeper
  
  observe Page
  
  def after_save(page)
    expire_fragment('flipboard')
  end

  def after_destroy(page)
    expire_fragment('flipboard')
  end
  
end