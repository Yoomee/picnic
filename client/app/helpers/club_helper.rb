module ClubHelper
  
  def tag_li_attributes(tag, tag_array)
    returning out = {:id => "connection_tag_#{tag.to_s.fully_underscore}"} do
      out[:class] = 'active_tag' if tag == tag_array.first
    end
  end
  
  def tags_bottom_attributes(tag, tag_array)
    returning out = {:id => "tags_bottom_#{tag.to_s.fully_underscore}"} do
      out[:style] = 'display:none' unless tag == tag_array.first
    end
  end
  
end