module TagsHelper

  def link_to_tag(tag, options = {})
    options.reverse_merge!(:li => true)
    options[:class] = "tag #{options[:class]}"
    options[:class] << "active" if options.delete(:active)
    options[:class].strip!
    out = link_to(content_tag(:span,tag.to_s), tag.to_tag, options.reject{|k,v| %w{li always_show}.include?(k.to_s)})
    if options[:show_count]
      tag_count = options[:member] ? options[:member].shouts.tagged_with(tag.to_s).count : Shout.tagged_with(tag.to_s).count
      out << content_tag(:span, tag_count, :class => "count") unless tag_count.zero?
    end
    options[:li] ? content_tag(:li, out) : out
  end

  def shared_tag_links(member1, member2)
    shared_tag_link_lis(member1.tags & member2.tags)
  end

  def shared_theme_links(member1, member2)
    shared_tag_link_lis(member1.shout_tags & member2.shout_tags)
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
