class ClubController< ApplicationController
  
  member_only :connections
  before_filter :refresh_fb_session, :only => :connections

  def connections
    @member_tags = logged_in_member ? logged_in_member.tags_with_other_members.randomize.first(5) : []
    @theme_tags = Tag.without_id_in(@member_tags.collect(&:id) + logged_in_member.tags).top_member_tags.limit(5)
    @bring_members = Member.not_including(logged_in_member).with_what_i_bring.random.limit(12)
    @nearby_members = Member.without_friend_request_with(logged_in_member).with_lat_lng.within_distance_of(logged_in_member, 1000)
    @connections = logged_in_member.connections(:limit => 5, :facebook_user => current_facebook_user)
  end
  
  def discussions
  end
  
  def index
    @filter = params[:filter] || (logged_in? ? "blanket" : "latest")
    @filter = "latest" if !%w{latest comments popular blanket}.include?(@filter) || @filter == "blanket" && !logged_in?
    @shouts = Shout.get_shouts(@filter, @logged_in_member)
    if request.xhr?
      render :text => @template.render_shouts(@shouts, :filter => @filter) + @template.javascript_tag(@template.refresh_fb_dom)
    end
  end
  
  def leaderboard
  end
  
  def rules
    @rules_page = Page.find_by_slug(:ground_rules)
  end
  
end