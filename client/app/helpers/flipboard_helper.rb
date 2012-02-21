module FlipboardHelper
  
  def get_flipboard_content
    sponsors = Page::random_sponsors(3)
    pages_sections = Section.find_by_slug(:news).all_children(:published_only => true, :latest => true)#.first(5)
    pages_sections += Section.find_by_slug(:stories).all_children(:published_only => true, :latest => true)#.first(20)
    pages_sections.extend(SectionsController::SortByWeightAndPublished)
    pages_sections.sort_by_weight_and_published
    #pages_sections = pages_sections.randomize
    tweets = get_latest_tweets_from("PICNICfestival", 5, false, true)
    speakers = Member.with_badge(:picnic11_speaker).latest.limit(15).all
    flipitems = []
    if (photo_dispatch_item = get_photo_dispatch_item)
      flipitems << photo_dispatch_item
    end
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
    puts "flipitems.size = #{flipitems.size}"
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
  
  def get_photo_dispatch_item
    begin
      Rails.logger.info("Getting latest photo dispatch")
      rss = RSS::Parser.parse(open("http://photodispatch.nl/rss/picnic11").read, false)
      item = rss.items.first
      {:flip_partial => "photo_dispatch", :image_url => item.enclosure.url, :text => item.title, :color => "#C9DCDF"}
    rescue => e
      Rails.logger.info("FAILED to fetch latest photo dispatch. Error: #{e}")
      nil
    rescue Timeout::Error => e
      Rails.logger.info("FAILED to fetch latest photo dispatch. Error: #{e}")
      nil
    end
  end
  
  def render_flip_item(flipitem, template)
    if flipitem.is_a?(String)
      flip_partial = flipitem
    elsif flipitem.respond_to?(:flip_partial)
      flip_partial = flipitem.flip_partial
    elsif flipitem.is_a?(Struct::Tweet)
      flip_partial = "tweet"
    elsif flipitem.is_a?(Hash)
      flip_partial = flipitem[:flip_partial]
    else
      flip_partial = flipitem.class.to_s.underscore
    end
    render("flipboard/flips/#{flip_partial}/x#{template[0]}y#{template[1]}.html.haml", :flipitem => flipitem, :x => template[0], :y => template[1])
  end
  
  def render_flipboard
    return "" if Section.find_by_slug(:news).nil?
    # flipboard_content = Rails.cache.fetch("flipboard_content", :expires_in => 1.day) do
    #   get_flipboard_content
    # end
    # render("flipboard/flipboard", :flipboard_content => flipboard_content)
    render("flipboard/flipboard", :flipboard_content => get_flipboard_content)
  end
  
end
