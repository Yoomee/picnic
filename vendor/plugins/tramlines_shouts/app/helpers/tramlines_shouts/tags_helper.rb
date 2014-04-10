module TramlinesShouts::TagsHelper
  
  def link_to_tag(tag, options = {})
    tag = tag.to_tag
    options.reverse_merge!(:li => true)
    options[:class] = "tag #{options[:class]}"
    options[:class] << "active" if options.delete(:active)
    options[:class].strip!
    options[:style] = "background:#{tag.color}" if tag.respond_to?(:color) && tag.color
    out = link_to(content_tag(:span,tag.to_s), tag.to_tag, options.reject{|k,v| %w{li always_show}.include?(k.to_s)})
    if options[:show_count]
      tag_count = options[:member] ? options[:member].shouts.tagged_with(tag.to_s).count : Shout.tagged_with(tag.to_s).count
      out << content_tag(:span, tag_count, :class => "count") unless tag_count.zero?
    end
    options[:li] ? content_tag(:li, out) : out
  end
  
  def url_to_tag(tag, options = {})
    url_for({:controller => "tags", :action => "show", :id => u(tag)}.merge(options))
  end
  
  def tags_facelist_javascript(options = {})
    if !request.xhr? && !options[:in_head]
      content_for(:head) {tags_facelist_javascript(options.merge(:in_head => true))}
    else
      javascript_tag do
        "$(document).ready(function() {
          $('##{options[:prefix] ? options[:prefix] + '_' : ''}tags_text').faceList('/tags/autocomplete', {
            returnID: '#{options[:prefix] ? options[:prefix] + '_' : ''}tags',
            minChars: 2,
            intro_text: '#{options[:intro_text]}',
            no_result: '',
            formatList: function(data, formatted) {return formatted.html(data['name']);},
            queryParam: 'term',
            selectedItem: 'value',
            neverSubmit: true,
            start_value: #{options[:tag_list].collect {|t| {:value => t}}.to_json},
            resultClick: function(data) {$.fancybox.resize();$('#as-input-#{options[:prefix] ? options[:prefix] + '_' : ''}tags').focus()},
            resultsComplete: function(elem) {
              var height = $('.facelist-result-item').size() * $('.facelist-result-item').outerHeight();
              $('#fancybox-inner').height($('#fancybox-inner').height() + height);
              $('#as-input-tags').focus();
            }
          });
        });"
      end
    end
  end
  
end