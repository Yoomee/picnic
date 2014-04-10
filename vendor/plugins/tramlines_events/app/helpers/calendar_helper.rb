module CalendarHelper
  
  def calendar(options = {}, &block)
    block ||= Proc.new {|d| nil}

    defaults = {
      :year => (Time.zone || Time).now.year,
      :month => (Time.zone || Time).now.month,
      :abbrev => true,
      :first_day_of_week => 0,
      :show_today => true,
      :show_header => true,
      :month_name_text => (Time.zone || Time).now.strftime("%B %Y"),
      :previous_month_text => nil,
      :next_month_text => nil,
      :event_strips => [],

      # it would be nice to have these in the CSS file
      # but they are needed to perform height calculations
      :width => nil,
      :height => 500,
      :day_names_height => 18,
      :day_nums_height => 18,
      :event_height => 18,
      :event_margin => 1,
      :event_padding_top => 2,

      :use_all_day => false,
      :use_javascript => true,
      :link_to_day_action => false
    }
    options = defaults.merge options

    # default month name for the given number
    if options[:show_header]
      options[:month_name_text] ||= I18n.translate(:'date.month_names')[options[:month]]
    end

    # make the height calculations
    # tricky since multiple events in a day could force an increase in the set height
    height = options[:day_names_height]
    row_heights = cal_row_heights(options)
    row_heights.each do |row_height|
      height += row_height
    end

    # the first and last days of this calendar month
    if options[:dates].is_a?(Range)
      first = options[:dates].begin
      last = options[:dates].end
    else
      first = Date.civil(options[:year], options[:month], 1)
      last = Date.civil(options[:year], options[:month], -1)
    end

    # create the day names array [Sunday, Monday, etc...]
    day_names = []
    if options[:abbrev]
      day_names.concat(I18n.translate(:'date.abbr_day_names'))
    else
      day_names.concat(I18n.translate(:'date.day_names'))
    end
    options[:first_day_of_week].times do
      day_names.push(day_names.shift)
    end

    # Build the HTML string
    cal = ""

    # outer calendar container
    cal << %(<div class="ec-calendar")
    cal << %(style="width: #{options[:width]}px;") if options[:width]
    cal << %(>)

    # table header, including the monthname and links to prev & next month
    if options[:show_header]
      cal << %(<table class="ec-calendar-header" cellpadding="0" cellspacing="0">)
      cal << %(<thead><tr>)
      if options[:previous_month_text] or options[:next_month_text]
        cal << %(<th colspan="2" class="ec-month-nav ec-previous-month">#{options[:previous_month_text]}</th>)
        colspan = 3
      else
        colspan = 7
      end
      cal << %(<th colspan="#{colspan}" class="ec-month-name">#{options[:month_name_text]}</th>)
      if options[:next_month_text]
        cal << %(<th colspan="2" class="ec-month-nav ec-next-month">#{options[:next_month_text]}</th>)
      end
      cal << %(</tr></thead></table>)
    end

    # body container (holds day names and the calendar rows)
    cal << %(<div class="ec-body" style="height: #{height}px;">)

    # day names
    cal << %(<table class="ec-day-names" cellpadding="0" cellspacing="0">)
    cal << %(<tbody><tr>)
    day_names.each do |day_name|
      cal << %(<th class="ec-day-name" title="#{day_name}">#{day_name}</th>)
    end
    cal << %(</tr></tbody></table>)

    # container for all the calendar rows
    cal << %(<div class="ec-rows" style="top: #{options[:day_names_height]}px; )
    cal << %(height: #{height - options[:day_names_height]}px;">)

    # initialize loop variables
    first_day_of_week = beginning_of_week(first, options[:first_day_of_week])
    last_day_of_week = end_of_week(first, options[:first_day_of_week])
    last_day_of_cal = end_of_week(last, options[:first_day_of_week])
    row_num = 0
    top = 0

    # go through a week at a time, until we reach the end of the month
    while(last_day_of_week <= last_day_of_cal)
      cal << %(<div class="ec-row" style="top: #{top}px; height: #{row_heights[row_num]}px;">)
      top += row_heights[row_num]

      # this weeks background table
      cal << %(<table class="ec-row-bg" cellpadding="0" cellspacing="0">)
      cal << %(<tbody><tr>)
      first_day_of_week.upto(first_day_of_week+6) do |day|
        today_class = (day == Date.today) ? "ec-today-bg" : ""
        other_month_class = (day < first) || (day > last) ? 'ec-other-month-bg' : ''
        cal << %(<td class="ec-day-bg #{today_class} #{other_month_class}">&nbsp;</td>)
      end
      cal << %(</tr></tbody></table>)

      # calendar row
      cal << %(<table class="ec-row-table" cellpadding="0" cellspacing="0">)
      cal << %(<tbody>)

      # day numbers row
      cal << %(<tr>)
      first_day_of_week.upto(last_day_of_week) do |day|
        cal << %(<td class="ec-day-header )
        cal << %(ec-today-header ) if options[:show_today] and (day == Date.today)
        cal << %(ec-other-month-header ) if (day < first) || (day > last)
        cal << %(ec-weekend-day-header) if weekend?(day)
        cal << %(" style="height: #{options[:day_nums_height]}px;">)
        if options[:link_to_day_action]
          cal << day_link(day.day, day, options[:link_to_day_action])
        else
          cal << %(#{day.day})
        end
        cal << %(</td>)
      end
      cal << %(</tr>)

      # event rows for this day
      # for each event strip, create a new table row
      options[:event_strips].each do |strip|
        cal << %(<tr>)
        # go through through the strip, for the entries that correspond to the days of this week
        strip[row_num*7, 7].each_with_index do |event, index|
          day = first_day_of_week + index

          if event
            # get the dates of this event that fit into this week
            dates = event.clip_range(first_day_of_week, last_day_of_week)
            # if the event (after it has been clipped) starts on this date,
            # then create a new cell that spans the number of days
            if dates[0] == day.to_date
              # check if we should display the bg color or not
              no_bg = no_event_bg?(event, options)

              cal << %(<td class="ec-event-cell" colspan="#{(dates[1]-dates[0]).to_i + 1}" )
              cal << %(style="padding-top: #{options[:event_margin]}px;">)
              cal << %(<div class="ec-event ec-event-#{event.id} )
              if no_bg
                cal << %(ec-event-no-bg" )
                cal << %(style="color: #{event.color}; )
              else
                cal << %(ec-event-bg" )
                cal << %(style="background-color: #{event.color}; )
              end

              cal << %(padding-top: #{options[:event_padding_top]}px; )
              cal << %(height: #{options[:event_height] - options[:event_padding_top]}px;" )
              if options[:use_javascript]
                # custom attributes needed for javascript event highlighting
                cal << %(data-event-id="#{event.id}" data-color="#{event.color}" )
              end
              cal << %(>)

              # add a left arrow if event is clipped at the beginning
              if event.start_at.to_date < dates[0]
                cal << %(<div class="ec-left-arrow"></div>)
              end
              # add a right arrow if event is clipped at the end
              if event.end_at.to_date > dates[1]
                cal << %(<div class="ec-right-arrow"></div>)
              end

              if no_bg
                cal << %(<div class="ec-bullet" style="background-color: #{event.color};"></div>)
                # make sure anchor text is the event color
                # here b/c CSS 'inherit' color doesn't work in all browsers
                cal << %(<style type="text/css">.ec-event-#{event.id} a { color: #{event.color}; }</style>)
              end

              if block_given?
                # add the additional html that was passed as a block to this helper
                cal << block.call({:event => event, :day => day.to_date, :options => options})
              else
                # default content in case nothing is passed in
                cal << %(<a href="/events/#{event.id}" title="#{h(event.name)}">#{h(event.name)}</a>)
              end

              cal << %(</div></td>)
            end

          else
            # there wasn't an event, so create an empty cell and container
            cal << %(<td class="ec-event-cell ec-no-event-cell" )
            cal << %(style="padding-top: #{options[:event_margin]}px;">)
            cal << %(<div class="ec-event" )
            cal << %(style="padding-top: #{options[:event_padding_top]}px; )
            cal << %(height: #{options[:event_height] - options[:event_padding_top]}px;" )
            cal << %(>)
            cal << %(&nbsp;</div></td>)
          end
        end
        cal << %(</tr>)
      end

      cal << %(</tbody></table>)
      cal << %(</div>)

      # increment the calendar row we are on, and the week
      row_num += 1
      first_day_of_week += 7
      last_day_of_week += 7
    end

    cal << %(</div>)
    cal << %(</div>)
    cal << %(</div>)
  end
  
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # override this in your own helper for greater control
  def day_link(day_text, date, day_action)
    out = "<span class='ec-day-link'>"
    if allowed_to?(new_event_proc)
      out << link_to("+", new_event_path(:year => date.year, :month => date.month, :day => date.day), :class => 'ec-add-event', :style => "display:none")
    end
    out << link_to(day_text, url_for_day(date), :class => 'ec-view-event', :style => "display:none")
    out << content_tag(:span, day_text, :class => "ec-day-text")
    out << "</span>"
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.last_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :use_all_day => true,
      :link_to_day_action => true
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, date = args[:event], args[:day]
      link_if_allowed("#{display_event_time(event, date)} #{event.name}", event_proc(event.page), :title => event.name)
    end
  end
  
  def event_category_select_options(selected = nil)
    out = content_tag(:option, "All categories") #, :style => "background-color:#000;color:#fff;")
    EventCategory.all.inject(out) do |out, category|
      html_options = {:value => category.id} #, :style => "background-color:#{category.color};color:#fff;"}
      html_options[:selected] = "selected" if category == selected
      out << content_tag(:option, category.name, html_options)
    end
    # options_from_collection_for_select(EventCategory.all, :id, :name, @category)    
  end
  
  def tramlines_calendar_javascript
    javascript_tag do
      "var Calendar = {
        init_day_hovers: function() {
          $('.ec-day-header').hover(
            function() {
              $(this).find('.ec-day-text').hide();
              $(this).find('.ec-add-event, .ec-view-event').show();
            },
            function() {          
              $(this).find('.ec-add-event, .ec-view-event').hide();
              $(this).find('.ec-day-text').show();
            }
          );
        }
      };
      $(document).ready(function() {
        Calendar.init_day_hovers();
      });"
    end
  end
  
end