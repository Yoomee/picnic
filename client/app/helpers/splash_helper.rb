module SplashHelper
  
  def splash_page_advert
    @splash_page_advert ||= AdvertCampaign::splash_page.adverts.active.random_element
  end
  
  def show_splash_page?
    !logged_in_member && !session[:seen_splash_page] && splash_page_advert
  end
  
end