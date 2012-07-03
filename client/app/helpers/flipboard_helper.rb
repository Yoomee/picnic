require 'hpricot'
require 'open-uri'
module FlipboardHelper
  
  def get_flipboard_content
    sponsors = Page::random_sponsors(3)
    pages_sections = Section.find_by_slug(:news).all_children(:published_only => true, :latest => true)#.first(5)
    pages_sections += Section.find_by_slug(:stories).all_children(:published_only => true, :latest => true)#.first(20)
    pages_sections.extend(SectionsController::SortByWeightAndPublished)
    pages_sections = pages_sections.sort_by_published.select(&:has_photo?)
    #pages_sections = pages_sections.randomize
    tweets = get_latest_tweets_from("PICNICfestival", 5, false, true)
    speakers = Member.with_badge(:picnic12_speaker).latest.limit(15).all
    flickr_photos = get_latest_flickr_photos
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
    flickr_photos.each_with_index do |flickr_photo, index|
      flipitems.insert((index + 1) * (total_size / flickr_photos.size), flickr_photo)
    end
    flipboard_content = []
    template_id = 0
    until flipitems.empty? do
      template = FlipcolTemplate.new(template_id)
      items = []
      template.flipitems.each do |flipitem_template|
        candidates = flipitems.dup
        flipitem = get_suitable_flipitem(candidates, flipitem_template)
        if flipitem
          flipitems.delete(flipitem)
          items << flipitem
        end
      end
      flipboard_content << [template, items.compact]
      if (template_id + 1 == FlipcolTemplate::TEMPLATES.size)
        template_id = 0
      else
        template_id += 1
      end
    end
          
    # until flipitems.empty? do
    #   template = FlipcolTemplate.new(template_id)
    #   items = []
    #   template.flipitems.each do |flipitem_template|
    #     item_queue = []
    #     until flipitems.empty? || FlipcolTemplate.can_display_item?(flipitem = flipitems.shift, flipitem_template)
    #       item_queue << flipitem
    #     end
    #     if !flipitems.empty?
    #       items << flipitem
    #       flipitems = item_queue + flipitems
    #     end
    #   end
    #   flipboard_content << [template, items.compact]
    #   if (template_id+1 == FlipcolTemplate::TEMPLATES.size)
    #     template_id = 0
    #   else
    #     template_id += 1
    #   end
    # end
    flipboard_content
  end
  
  def get_suitable_flipitem(candidates, template)
    return nil if candidates.empty?
    flipitem = candidates.shift
    if FlipcolTemplate.can_display_item?(flipitem, template)
      flipitem
    else
      get_suitable_flipitem(candidates, template)
    end
  end
  
  def get_latest_flickr_photos
    begin
      Rails.logger.info("Getting latest Flickr Photos")
      #rss = RSS::Parser.parse(open("http://api.flickr.com/services/feeds/photos_public.gne?id=30196297@N07&lang=en-us&format=rss_200"))
      doc = Hpricot.XML open("http://api.flickr.com/services/feeds/photos_public.gne?id=30196297@N07&lang=en-us&format=rss_200"), :fixup_tags => true
      items = doc.search("//item")
      items.map {|item| {:flip_partial => 'flickr_photo', :image_url => item.at("media:content")['url'], :text => item.at("title").inner_html, :color => '#C9DCDF', :url => item.at('link').inner_html}}
    rescue => e
      Rails.logger.info("FAILED to fetch latest flickr photo. Error: #{e}")
      []
    rescue Timeout::Error => e
      Rails.logger.info("FAILED to fetch latest flickr photo. Error: #{e}")
      []
    end
  end
  
  def get_photo_dispatch_item
    begin
      Rails.logger.info("Getting latest photo dispatch")
      rss = RSS::Parser.parse(open("http://photodispatch.nl/rss/picnic11").read, false)
      item = rss.items.first
      url = item.enclosure.url.gsub(/photodispatch\.nl/, "photodispatch.net")
      {:flip_partial => "photo_dispatch", :image_url => url, :text => item.title, :color => "#C9DCDF"}
    rescue => e
      Rails.logger.info("FAILED to fetch latest photo dispatch. Error: #{e}")
      nil
    rescue Timeout::Error => e
      Rails.logger.info("FAILED to fetch latest photo dispatch. Error: #{e}")
      nil
    end
  end
  
  def render_flip_item(flipitem, template)
    @flipitem_count ||= 0
    @flipitem_count += 1
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
