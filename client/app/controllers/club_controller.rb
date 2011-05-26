class ClubController< ApplicationController
  
  member_only :connections

  def connections
    @member_tags = logged_in_member ? logged_in_member.tags_with_other_members.randomize.first(5) : []
    @theme_tags = Tag.without_id_in(@member_tags.collect(&:id) + logged_in_member.tags).top_member_tags.limit(5)
    @bring_members = Member.not_including(logged_in_member).with_what_i_bring.random.limit(12)
    @nearby_members = Member.with_lat_lng.within_distance_of(logged_in_member, 250)
    @connections = logged_in_member.connections
  end
  
  def discussions
  end
  
  def index
    # if logged_out?
    #   return render(:template => "club/logged_out_index.html.haml")
    # end
    @latest_members = Member.latest
    @find_someone_members = Member.with_what_i_bring.with_image.random.limit(4)
  end
  
  def leaderboard
  end
  
end