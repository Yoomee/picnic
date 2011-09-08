ApplicationController.class_eval do
  
  include Facebooker2::Rails::Controller
  
  before_filter :check_what_i_bring
  before_filter :break_for_non_yoomee
  
  helper_method :home_section, :splash_page_advert
  
  def home_section
    return nil if Section.count < 1
    # section = Section.root.ascend_by_weight.first
    # while section.destination.is_a?(Section) && section.destination != section do
    #   section = section.destination 
    # end
    section = Section.find_by_slug("about_us")
    section
  end

  def login_member_with_api_auth!(member, options = {})
    if session.delete(:api_auth)
      login_member_without_api_auth!(member, :redirect => false)
      redirect_to :controller => "api", :action => "redirect"
    else
      login_member_without_api_auth!(member, options)
    end
  end
  alias_method_chain :login_member!, :api_auth

  protected
  def check_what_i_bring
    return redirect_to(what_i_bring_path) if logged_in_member && logged_in_member.blank_what_i_bring? && !logged_in_member.force_password_change?
  end
  
  def splash_page_advert
    @splash_page_advert ||= AdvertCampaign::splash_page.adverts.active.random_element
  end
  
  def break_for_non_yoomee
    if request.host =~ /picnic.yoomee.com/ && logged_in_member
      report_error "This site is locked down whilst we transfer it to http://picnicnetwork.org" unless logged_in_member.try(:email) =~ /yoomee.com$/
    end
  end
  
end