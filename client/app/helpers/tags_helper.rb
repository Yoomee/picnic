module TagsHelper

  def shared_tag_links(member1, member2)
    shared_tag_link_lis(member1.tags & member2.tags)
  end

  def shared_theme_links(member1, member2)
    shared_tag_link_lis(member1.shout_tags & member2.shout_tags)
  end

  def top_tags_including_conference(top_tags_limit = 10)
    (Tag.top_tags.limit(top_tags_limit) + Tag.conference).uniq.randomize
  end

  def trending_tags_including_conference(top_tags_limit = 10)
    (Tag.top_tags_since(1.month.ago).limit(top_tags_limit) + Tag.conference).uniq.randomize
  end

  def tag_people_profile_photo(member)
    render "tags/people_profile_photo", :member => member
  end

  def url_to_tag(tag, options = {})
    url_for({:controller => "tags", :action => "show", :id => u(tag)}.merge(options))
  end

  private
  def shared_tag_link_lis(tags)
    tags.inject('') {|memo, tag| memo + content_tag(:li, link_to_self(tag.to_tag, :class => 'tag'))}
  end
  
end
