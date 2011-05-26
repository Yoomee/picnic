class ClubController< ApplicationController

  def connections
    @member_tags = logged_in_member ? logged_in_member.tags_with_other_members.randomize.first(5) : []
    @theme_tags = Tag.top_tags.limit(5)
    @bring_members = Member.scope_for_without_id_in('members', [logged_in_member.id]).with_what_i_bring.random.limit(12)
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