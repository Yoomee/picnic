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
    return "" if Section.find_by_slug(:news).nil?
    flipboard_content = Rails.cache.fetch("flipboard_content", :expires_in => 1.day) do
      get_flipboard_content
    end
    render("flipboard/flipboard", :flipboard_content => flipboard_content)
  end
  
  def get_flipboard_content
    sponsors = Page::random_sponsors(3)
    pages_sections = Section.find_by_slug(:news).all_children(:published_only => true, :latest => true).first(15)
    tweets = get_latest_tweets_from("PICNICfestival", 5, false, true)
    speakers = Member.with_badge(:picnic11_speaker).latest.limit(15).all
    flipitems = []
    until pages_sections.empty? && speakers.empty?
      flipitems << pages_sections.shift unless pages_sections.empty?
      flipitems << speakers.shift unless speakers.empty?
    end
    total_size = flipitems.size
    sponsors.each_with_index do |sponsor, index|
      flipitems.insert((index+1)*(total_size /sponsors.size), sponsor)
    end
    tweets.each_with_index do |tweet, index|
      flipitems.insert((index+1)*(total_size/tweets.size), tweet)
    end
    flipboard_content = []
    template_id = 0
    until flipitems.empty? do
      template = FlipcolTemplate.new(template_id)
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
      if (template_id+1 == FlipcolTemplate::TEMPLATES.size)
        template_id = 0
      else
        template_id += 1
      end
    end
    flipboard_content
  end
  
end