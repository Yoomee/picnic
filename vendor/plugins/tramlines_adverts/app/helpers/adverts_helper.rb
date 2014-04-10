module AdvertsHelper
  
  def render_advert(img_size = nil, options = {})
    options.reverse_merge!(:advert => Advert.active.random_element, :class => "advert")
    if advert = options.delete(:advert)
      advert.increment!(:impression_count)
      link_options = advert.url_external? ? {:target => "_blank"} : {}
      content_tag(:div, options) do
        link_to(image_for(advert, img_size), click_advert_path(advert), link_options)
      end
    else
      ""
    end
  end
  
end