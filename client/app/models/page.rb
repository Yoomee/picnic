Page.class_eval do
  
  def flip_partial
    if section.try(:parent).try(:slug) == "sponsors"
      "sponsor"
    else
      "page_section"
    end
  end
  
end