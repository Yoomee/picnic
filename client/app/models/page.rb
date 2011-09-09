Page::FORM_TABS = %w{details snippets slideshow publishing related_items}
Page.class_eval do

  has_many :shouts, :as => :recipient, :dependent => :destroy

  rateable_by_member
  acts_as_taggable_on :tags
  has_slideshow
  
  class << self
    
    def random_sponsors(limit = 3)
      sponsors, premiums = [], []
      if section = Section.find_by_slug("premium-sponsors")
        premiums += section.pages.published
      end
      if section = Section.find_by_slug("sponsors-sponsors")
        sponsors += section.pages.published
      end
      if section = Section.find_by_slug("media-sponsors")
        sponsors += section.pages.published
      end
      premium = premiums.random_element || sponsors.delete_at(rand(sponsors.size))
      limit == 1 ? [premium] : [premium] + sponsors.random_elements(limit - 1)
    end
    
  end
  
  def color
    tags.color_not_null.first.try(:color) || '#C9DCDF'
  end
  
  def expires?
    expires_on.try(:year) != 2035
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