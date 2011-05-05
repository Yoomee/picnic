module TagsHelper

  def link_to_tag(tag, options = {})
    options.reverse_merge!(:li => true)
    options[:class] = "tag #{options[:class]}"
    options[:class] << "active" if options.delete(:active)
    options[:class].strip!
    out = link_to(content_tag(:span,tag.to_s), tag, options.reject{|k,v| %w{li always_show}.include?(k.to_s)})
    if options[:show_count]
      tag_count = options[:member] ? options[:member].shouts.tagged_with(tag.to_s).count : Shout.tagged_with(tag.to_s).count
      out << content_tag(:span, tag_count, :class => "count") unless tag_count.zero?
    end
    options[:li] ? content_tag(:li, out) : out
  end

end
