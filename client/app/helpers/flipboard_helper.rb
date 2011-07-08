module FlipboardHelper
  
  def render_flip_item(flipitem, template)
    if flipitem.is_a?(String)
      flip_partial = flipitem
    elsif flipitem.respond_to?(:flip_partial)
      flip_partial = flipitem.flip_partial
    elsif flipitem.is_a?(Struct::Tweet)
      flip_partial = "tweet"
    else
      flip_partial = flipitem.class.to_s.underscore
    end
    render("flipboard/flips/#{flip_partial}/x#{template[0]}y#{template[1]}.html.haml", :flipitem => flipitem, :x => template[0], :y => template[1])
  end
  
  
end