module PagesHelper
  
  def left_hand_subtitle(page)
    parts = left_hand_subtitle_parts(page)
    out = "#{parts[0].upcase} #{content_tag(:strong, parts[1].upcase)}"
    out << link_to_function("See all updates", "$('body').animate({'scrollTop':0}, 1000)", :id=>"back_to_updates") if page.section == Section.find_by_slug('news')
    out
  end
  
  def left_hand_subtitle_parts(page)
    case
    when page.section == Section.find_by_slug("news")
      ['Festival', 'Updates']
    when page.section.parent_at_depth_name(1).split.size > 1
      depth_1_name = page.section.parent_at_depth_name(1)
      [depth_1_name.split.first, depth_1_name.gsub(/^\w+/, '')]
    when page.section.parent_at_depth(1)
      [page.section.root.name.upcase, page.section.parent_at_depth(1).name]
    when page.title.split.size > 1
      [page.title.split.first, page.title.gsub(/^\w+/, '')]
    else
      [page.section.root.name, page.title]
    end
  end
  
end