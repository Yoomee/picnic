module ContentFlagsHelper
  
  def content_flag_link(*args)
    options = args.extract_options!
    options.reverse_merge!(:text => "Report")
    attachable = args.first
    options[:class] = "content_flag_link #{options[:class]}"
    if attachable.nil?
      link_to_box options.delete(:text), new_content_flagging_path(:url => options.delete(:url) || request.request_uri), options
    else
      link_to_box options.delete(:text), "/#{attachable.class.to_s.underscore}/#{attachable.id}/content_flaggings/new", options    
    end
  end
  
  def content_flag_url(content_flag)
    content_flag.attachable.nil? ? content_flag.url : url_for(content_flag.attachable)
  end
  
  def content_flag_external_url(content_flag)
    site_url + content_flag_url(content_flag)
  end
  
  def content_flag_type_box(content_flag)
    stripes = ""
    unless (colors = content_flag.content_flag_types.ascend_by_name.uniq.collect(&:color)).blank?
      stripe_width = (20/colors.size.to_f).round
      colors.each do |color|
        width = (color == colors.last ? 20 - stripe_width*(colors.size - 1) : stripe_width)
        stripes << content_tag(:div, "", :class => "stripe", :style => "background-color:#{color};width:#{width}px")
      end
    end
    content_tag(:div, stripes, :class => "content_flag_type_box")
  end
  
  def content_flag_type_label(content_flag_type)
    content_tag(:span, content_flag_type, :class => "content_flag_type_label", :style => "background-color:#{content_flag_type.color}")
  end
  
  def in_moderation?
    controller_name.in?(%w{content_flags content_flaggings content_flag_types content_filter_words})
  end
  
  def link_to_moderation_content(*args, &block)
    defaults = {:loading => "ModerationContent.loading();", :complete => "ModerationContent.finished();", :method => :get}
    if block_given?
      args.first.reverse_merge!(defaults)
    else
      args.second.reverse_merge!(defaults)
    end
    link_to_remote(*args, &block)
  end
  
  def link_to_every_word(object, attribute)
    returning html = "" do
      html << content_tag(:p, :class => "highlightable"){object.send(attribute).gsub(/[\w]+/,link_to_function('\0', "HighlightText.toggleHighlighted($(this))"))}
      html << render('content_filter_words/multiple_words_form', :uid => "#{object.class.to_s.underscore}_#{object.id}_#{attribute}")
    end
  end
  
  def moderation_back_link
    if params[:menu_item]=="content_flag_type" && @content_flag_type
      url = content_flag_type_path(@content_flag_type)
    else
      url = params[:menu_item]=="resolved" ? resolved_content_flags_path : inbox_content_flags_path
    end
    link_to_moderation_content("&larr; Back", :url => url)
  end
  
  def moderation_nav_links(content_flag)
    options = {:menu_item => params[:menu_item], :content_flag_type_id => @content_flag_type.try(:id)}
    out = ""
    if prev_content_flag = content_flag.prev(options)
      out << link_to_moderation_content("< Previous", :url => content_flag_path(prev_content_flag, options))
    else
      out << content_tag(:span, "< Previous")
    end
    if next_content_flag = content_flag.next(options)
      out << link_to_moderation_content("Next >", :url => content_flag_path(next_content_flag, options))
    else
      out << content_tag(:span, "Next >")
    end
    out
  end
  
  def highlight_content_filter_words_javascript
    javascript_tag do
      "var HighlightText = {
        addHighlighted: function(elem) {
          elem.parent().children(':contains(\"' + elem.html() + '\")').addClass('cf_highlighted')
          var form = HighlightText.getForm(elem);
          form.prepend('<input name=\\'content_filter_words[]\\' type=\\'hidden\\' value=\\'' + elem.html() + '\\' />');
          if(form.not(':visible')) { form.show(); }
        },
        clearHighlighting: function(form_id){
          $('#' + form_id + '').prev('p.highlightable').children('.cf_highlighted').removeClass('cf_highlighted');
        },
        getForm: function(elem) {
          return elem.parent().next('form');
        },
        loading: function(elem){
          elem.children('input[type=\"submit\"]').hide();
          elem.children('.ajax_loader').show();
        },
        removeHighlighted: function(elem) {
          elem.parent().children().filter(function(){return $(this).html() == elem.html();}).removeClass('cf_highlighted');
          var form = HighlightText.getForm(elem);
          form.children('input[value=\"' + elem.html() + '\"]').remove();
          if(elem.siblings('.cf_highlighted').length < 1) {
            form.hide();
          }
        },
        toggleHighlighted: function(elem) {
          if(elem.hasClass('cf_highlighted')){
            HighlightText.removeHighlighted(elem);              
          } else {
            HighlightText.addHighlighted(elem);
          }
        }
      }
      "
    end
  end
  
end

