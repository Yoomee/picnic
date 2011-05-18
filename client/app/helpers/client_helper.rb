module ClientHelper
  
  def nav_items
    items = Section.root.collect{|section| {
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
  
  def viewing_club?
    current_page?(club_path) || current_page?(new_member_path)
  end
  alias_method :in_club?, :viewing_club?
  
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
  
  def shout_title(shout)
    out = shout.pretty_date
    shout.title.blank? ? out : "#{out}: #{shout.title}"
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
  
end