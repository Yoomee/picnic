ApplicationController.class_eval do
  
  include Facebooker2::Rails::Controller
  
  before_filter :check_what_i_bring
  
  helper_method :home_section_path

  
  def home_section_path
    if Section.count > 1
      section_path Section.root.ascend_by_weight.first
    else
      home_path
    end
  end

  protected
  def check_what_i_bring
    return redirect_to(what_i_bring_path) if logged_in_member && logged_in_member.what_i_bring.blank? && !logged_in_member.force_password_change?
  end
  
end