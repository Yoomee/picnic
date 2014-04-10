module SlideshowHelper
  
  def render_slideshow_form_for(attachable)
    render("slideshows/attachable_form", :attachable => attachable)
  end
  
  def render_slideshow(slideshow)
    return "" if slideshow.nil? || !slideshow.active? || slideshow.slideshow_items.empty?
    render("slideshows/slideshow", :slideshow => slideshow)
  end
  
end