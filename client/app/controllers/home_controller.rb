HomeController.class_eval do

  after_filter :set_seen_flash_page, :only => :index
  
  def index
  end
  
  private
  def set_seen_flash_page
    session[:seen_splash_page] = !session[:seen_splash_page]
  end
  
end