ApplicationController.class_eval do
  
  include Facebooker2::Rails::Controller
  
  
  helper_method :home_section_path

  
  def home_section_path
    if Section.count > 1
      section_path Section.root.ascend_by_weight.first
    else
      home_path
    end
  end

end