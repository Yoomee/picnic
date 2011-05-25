module ClientHelper
  
  def conference_day(date_or_datetime)
    date = date_or_datetime.to_date
    if date < Date.parse("2011-09-14") || date > Date.parse("2011-09-16")
      return nil 
    else
      "#{date.day - 13} (#{date.strftime("%a %e %B")})"
    end
  end
  
  def conference_session_time(session)
    start = session.starts_at.strftime("%H:%M")
    session.ends_at.blank? ? start : "#{start} - #{session.ends_at.strftime("%H:%M")}"
  end
  
  def fancybox_edit(object, input, options ={})
    options.reverse_merge!(:link_text => "Edit")
    return "" if !allowed_to?({:controller => object.class.to_s.tableize, :action => :update, :id => object.id})
    div_id = "#{object.class.to_s.tableize}_#{object.id}_edit_#{input}_fancy_form"
    update_id = options[:update_id] || "#{object.class.to_s.tableize}_#{object.id}_#{input}"
    out = fancy_box :title => nil, :id => div_id, :link => {:content => options.delete(:link_text), :options => {:inline => true, :class => "fancybox_edit", :fancybox_wrapper_class => "fancybox_edit"}} do
      render((options.delete(:partial) || 'fancybox/edit'), :object => object, :input => input, :update_id => update_id, :options => options)
    end
  end
  
  def favicon(url, image = true)
    url = url.match(/^.*:\/\//) ? url : "http://#{url}"
    image ? image_tag(Url.favicon(url)) : url
  end

  def location_marker_image(location)
    "/client/images/marker_heart.png"
  end
  
  def member_marker_image(member)
    "/client/images/marker_heart.png"
  end
  
  def member_infobox(member)
    render "members/infobox", :member => member
  end
  
  def nav_items
    items = Section.root.not_hidden.collect{|section| {
      :name => section.name,
      :url => section_path(section),
      :active => current_root_section?(section),
      :weight => section.weight
    }}
    items << {
      :name => "Club",
      :url => club_path,
      :active => viewing_club?,
      :weight => 100
    }    
    items.sort{|x,y| x[:weight] <=> y[:weight]}
  end
  
  def shout_title(shout)
    #out = shout.pretty_date
    out = "#{time_ago_in_words(shout.created_at)} ago"
    shout.title.blank? ? out : "#{out}: #{shout.title}"
  end
  
  def themes_facelist_javascript(options = {})
    if !request.xhr? && !options[:in_head]
      content_for(:head) {themes_facelist_javascript(options.merge(:in_head => true))}
    else
      javascript_tag do
        "$(document).ready(function() {
          $('##{options[:prefix] ? options[:prefix] + '_' : ''}themes_text').faceList('#{url_for(:controller => 'tags', :action => 'autocomplete')}', {
            returnID: '#{options[:prefix] ? options[:prefix] + '_' : ''}themes',
            minChars: 2,
            intro_text: '#{options[:intro_text]}',
            no_result: '',
            formatList: function(data, formatted) {return formatted.html(data['name']);},
            queryParam: 'term',
            selectedItem: 'value',
            neverSubmit: true,
            start_value: #{options[:tag_list].collect {|t| {:value => t}}.to_json},
            resultClick: function(data) {$.fancybox.resize();$('#as-input-themes').focus();},
            resultsComplete: function(elem) {
              var height = $('.facelist-result-item').size() * $('.facelist-result-item').outerHeight();
              $('#fancybox-inner').height($('#fancybox-inner').height() + height);
              $('#as-input-themes').focus();
            }
          });
        });"
      end
    end
  end
  
  def viewing_club?
    current_page?(club_path) || current_page?(connections_path) || current_page?(leaderboard_path) || (controller_name == 'members') || controller_name=="tags"
  end
  alias_method :in_club?, :viewing_club?
  
end
