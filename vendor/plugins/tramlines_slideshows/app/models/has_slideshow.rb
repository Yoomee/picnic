# Note: to use slideshows on pages, add has_slideshow in page model and override FORM_TABS in client
# e.g. Page::FORM_TABS = %w{details snippets slideshow publishing related_items}

module HasSlideshow
  
  def self.included(klass)
    klass.has_one(:slideshow, :as => :attachable, :dependent => :destroy)
    klass.before_validation(:delete_slideshow_if_empty)
    klass.accepts_nested_attributes_for(:slideshow)
    klass.send(:define_method, :slideshow_with_initial_build) do
      @slideshow ||= (slideshow_without_initial_build || build_slideshow)
    end
    klass.alias_method_chain :slideshow, :initial_build
  end
  
  def has_slideshow?
    !slideshow.new_record? && slideshow.active? && !slideshow.slideshow_items.empty?
  end
  
  private
  # don't save slideshow if it has not been activated and given no slideshow_items
  def delete_slideshow_if_empty
    if slideshow.try(:new_record?) && !slideshow.active? && slideshow.slideshow_items.empty?
      slideshow.mark_for_destruction
    end
  end
  
end