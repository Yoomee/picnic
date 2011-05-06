HomeController.class_eval do

  helper_method :splash_page_advert
  after_filter :set_seen_flash_page, :only => :index

  def index
    redirect_to news_network_path if !show_splash_page?
  end
  
  private
  def set_seen_flash_page
    session[:seen_splash_page] = !session[:seen_splash_page]
  end
  
  def show_splash_page?
    !logged_in_member && !session[:seen_splash_page] && splash_page_advert
  end
  
  def splash_page_advert
    @splash_page_advert ||= AdvertCampaign::splash_page.adverts.active.random_element
  end
  
end