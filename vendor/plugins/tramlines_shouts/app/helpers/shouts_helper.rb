module ShoutsHelper

  extend ActiveSupport::Memoizable
  
  def clippy(id, bgcolor='#FFFFFF')
    html = <<-EOF
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="168"
              height="32"
              id="clippy" >
      <param name="movie" value="/flash/clippy.swf"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=#{id}">
      <param name="bgcolor" value="#{bgcolor}">
      <embed src="/flash/clippy.swf"
             width="168"
             height="32"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=#{id}"
             bgcolor="#{bgcolor}"
      />
      </object>
    EOF
  end

  def not_posted_yet_message(member)
    content_tag(:p, :id => 'no_posts') do
      "#{forename_or_you(member, "hasn't", :capitalize => true)} posted anything yet"
    end
  end
  
  def not_received_yet_message(parent)
    content_tag(:p, :id => 'no_posts') do
      if parent.is_a?(Member)
        "No-one has posted on #{forename_or_your(parent)} profile yet"
      else
        "No-one has posted here yet"
      end
    end
  end

  def older_shouts_link(name, url_options = {})
    link_to_remote(name, :url => older_shouts_link_url(url_options), :method => :get, :html => {:id => "older_shouts_link"})
  end

  def older_shouts_link_url(url_options = {})
    url_options.reverse_merge!(:page => ((params[:page] || 1).to_i + 1), :per_page => (params[:per_page] || 10), :named_scope => params[:named_scope])
    if parent = url_options.delete(:parent)
      url_options.merge!(:parent_type => parent.class, :parent_id => parent.id)
    end
    older_shouts_path(url_options)
  end

  def render_shouts_filter(parent_or_string, filter_names, options = {})
    options.reverse_merge!(:per_page => 10, :active => filter_names.first)
    render("shouts/filter", :parent_or_string => parent_or_string, :filter_names => filter_names, :active_filter => options.delete(:active), :filter_options => options)
  end

  def shouts_filter_link(parent_or_string, filter_name, options = {})
    options.reverse_merge!(:active => false, :per_page => 10)
    url_options = {:filter => filter_name, :per_page => options[:per_page]}
    if parent_or_string.is_a?(String)
      # dealing with a named_scope
      url_options.merge!(:named_scope => parent_or_string)
    else
      url_options.merge!(:parent_type => parent_or_string.class.to_s, :parent_id => parent_or_string.id)
    end
    li_with_active(options[:active], link_to_function(filter_name.humanize, "ShoutFilter.filter(#{url_options.to_json})"), :id => "shouts_filter_#{filter_name}")
  end

  def render_shout(shout, options = {})
    return "" if shout.nil?
    if shout.recipient.is_a?(Member) && shout.member != shout.recipient
      default_intro = "> #{link_to_self(shout.recipient)}"
    else
      default_intro = ""
    end
    options.reverse_merge!(:intro => default_intro, :compact_view => false, :search_term => nil)
    render("shouts/shout", options.merge(:shout => shout))
  end
  
  def render_shout_attachable(shout, options = {})
    options.reverse_merge!(:img_size => "x100", :fancy => true)
    case shout.attachable_type
    when "Video"
      if options[:fancy]
        link_to(content_tag(:span, '', :class => 'shout_attachable_icon') + image_for(shout.attachable, options[:img_size], :alt => ''), video_path(shout.attachable), :class => 'fancy-video')
      else
        link_to(image_for(shout.attachable, options[:img_size]),shout)
      end
    when "Photo"
      if options[:fancy]
        link_to_image("#{image_for(shout.attachable, options[:img_size], :url_only => true)}:#{shout.attachable.image.url}",:image_options => {:alt => ''})        
      else
        link_to(image_for(shout.attachable, options[:img_size]),shout)
      end
    when "Document"
      out = link_to(content_tag(:span, '', :class => 'shout_attachable_icon') + image_for(shout.attachable, "60x60", :alt => ''), shout.attachable)
      out << "<br /> #{link_to_self(shout.attachable)}"
    when "Link"
      render("shouts/link_info", :link => shout.attachable)
    when "PollQuestion"
      render("poll_questions/poll_question", :poll_question => shout.attachable)
    end
  end
  
  def render_shout_comments(shout, options = {})
    options.reverse_merge!(:replies_limit => 2, :reverse => true, :button_label => "Comment")
    if options[:wall_posts].nil? && !options[:replies_limit].nil? && shout.wall_posts.count > options[:replies_limit]
      out = "<div class='shout_comments_count'>"
      out << "<span id='wall_comment_text_#{shout.wall.id}'>#{pluralize(shout.wall_posts.count, 'comment')}</span>"
      out << older_posts_link(shout.wall, :text => "View more", :per_page => 10, :page => 1, :reverse => options[:reverse])
      out << image_tag('ajax_loader_squares.gif', :id => "shout_comment_loader_#{shout.wall.id}", :style => "display: none;")
      out << "</div>"
    else
      out = ""
    end
    out << render_wall_body(shout.wall, :limit => options[:replies_limit], :no_posts_message => '', :reverse => options[:reverse], :wall_posts => options[:wall_posts])
    if options[:wall_posts].nil?
      if allowed_to?(new_wall_post_proc)
        out << content_tag(:div, render_wall_form(shout.wall, :button_label => options[:button_label], :reverse => options[:reverse]), :class => "shout_comment_form")
      else
        out << content_tag(:div, link_to_login_fancybox(WallPostsController::HELP_MESSAGE, :class => "comment_prompt"), :class => "shout_comment_form")
      end
    end
    ret = "<div class='shout_comment_body'>"
    ret << content_tag(:div, out, :id => "shout_wall_#{shout.wall.id}", :class => "shout_comments")
    ret << "</div>"
  end
   
  # takes either array of shouts, parent object or name of a named_scope (as a string or symbol)
  def render_shouts(array_or_parent_or_string = "scoped_all", options = {})
    options.reverse_merge!(:per_page => 10, :older_link => "View more")
    shouts, options = get_shouts_and_options(array_or_parent_or_string, options)
    shouts = shouts.latest.paginate(:page => 1, :per_page => options[:per_page])
    out = render("shouts/wall", options.merge(:shouts => shouts))
    if (older_link_name = options.delete(:older_link)) && WillPaginate::ViewHelpers.total_pages_for_collection(shouts) > 1
      out << content_tag(:br, '', :class => 'clear')
      out << older_shouts_link(older_link_name, options)
    end
    out
  end
  
  def shout_on_submit(shout)
    "
    var shout_form_id = ShoutForm.form_id('#{shout.try(:id)}');
    if($(shout_form_id+' #shout_attach_type').val()=='Photo' || $(shout_form_id+' #shout_attach_type').val()=='Document'){
      ShoutForm.loading('#{shout.try(:id)}');
      $(shout_form_id).attr('target','photo_upload_iframe');
      return true; 
    } else {
      if (!ShoutForm.blank('#{shout.try(:id)}')) {
        jQuery.ajax({
          beforeSend:function(request){
            ShoutForm.loading('#{shout.try(:id)}');
          },
          data:jQuery.param(jQuery(this).serializeArray()) + '&authenticity_token=' + encodeURIComponent('#{form_authenticity_token}'),
          dataType:'script',
          type:'post',
          url:'#{shout.new_record? ? shouts_path : shout_path(shout)}'
        });
      }
      return false;
    }
    "
  end

  private
  def get_shouts_and_options(array_or_parent_or_string, options)
    case array_or_parent_or_string.class.to_s
      when "ActiveRecord::NamedScope::Scope", "Array", "WillPaginate::Collection"
        shouts = array_or_parent_or_string
      when "String", "Symbol"
        if !Shout.scopes.keys.include?(array_or_parent_or_string.to_sym)
          array_or_parent_or_string = "latest"
        end
        shouts = Shout.send(array_or_parent_or_string)
        options[:named_scope] = array_or_parent_or_string
      else
        shouts = array_or_parent_or_string.is_a?(Member) ? array_or_parent_or_string.profile_shouts : array_or_parent_or_string.shouts
        options[:parent] = array_or_parent_or_string
      end
    # when using render_shouts_filter, define client named_scopes as filter_[filter_name]
    if options[:filter] && Shout.respond_to?("filter_#{options[:filter]}")
      shouts = shouts.send("filter_#{options[:filter]}")
    end
    [shouts, options]
  end
  memoize :get_shouts_and_options

end
