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
  
  def render_flipboard
    flipitems = Page::random_sponsors(1) +
                (@pages_sections[1..@pages_sections.size] + 
                get_latest_tweets_from("PICNICfestival",10,false,true) + 
                Member.with_badge(:picnic11_speaker).all)
    # flipitems = flipitems.randomize
    flipboard_content = []
    until flipitems.empty? do
      template = FlipcolTemplate.new(flipboard_content.empty? ? 0 : nil)
      items = []
      template.flipitems.each do |flipitem_template|
        item_queue = []
        until flipitems.empty? || FlipcolTemplate.can_display_item?(flipitem = flipitems.shift, flipitem_template)
          item_queue << flipitem
        end
        if !flipitems.empty?
          items << flipitem
          flipitems = item_queue + flipitems
        end
      end
      flipboard_content << [template, items.compact]
    end
    render("flipboard/flipboard", :flipboard_content => flipboard_content)
  end
  
end