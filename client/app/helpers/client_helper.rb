module ClientHelper
  
  def nav_items
    items = Section.root.collect{|section| {
      :name => section.name,
      :url => section_path(section),
      :active => current_page?(section_path(section)),
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
  
end