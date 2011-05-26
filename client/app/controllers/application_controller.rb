ApplicationController.class_eval do
  
  include Facebooker2::Rails::Controller
  
  before_filter :check_what_i_bring
  
  helper_method :home_section, :splash_page_advert
  
  def home_section
    return nil if Section.count < 1
    section = Section.root.ascend_by_weight.first
    while section.destination.is_a?(Section) && section.destination != section do
      section = section.destination 
    end
    section
  end

  protected
  def check_what_i_bring
    return redirect_to(what_i_bring_path) if logged_in_member && logged_in_member.what_i_bring.blank? && !logged_in_member.force_password_change?
  end
  
  def splash_page_advert
    @splash_page_advert ||= AdvertCampaign::splash_page.adverts.active.random_element
  end
  
end