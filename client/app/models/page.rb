Page.class_eval do

  class << self
    
    def random_sponsors(limit = 3)
      sponsors = []
      if section = Section.find_by_slug("premium-sponsors")
        sponsors += section.pages.published*2
      end
      if section = Section.find_by_slug("sponsors-sponsors")
        sponsors += section.pages.published
      end
      if section = Section.find_by_slug("media-sponsors")
        sponsors += section.pages.published
      end
      limit == 1 ? [sponsors.random_element] : sponsors.random_elements(limit)
    end
    
  end
  
  def flip_partial
    if is_sponsor?
      "sponsor"
    else
      "page_section"
    end
  end

  def is_sponsor?
    section.try(:slug_in?, ["premium-sponsors", "sponsors-sponsors", "media-sponsors"])
  end
  
end