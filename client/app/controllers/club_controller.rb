class ClubController< ApplicationController

  def connections
    @member_tags = Tag.top_member_tags.limit(10)
    @bring_members = Member.scope_for_without_id_in('members', [logged_in_member.id]).with_what_i_bring.random.limit(12)
    # @same_tag_members = Member.scope_for_without_id_in('members', [logged_in_member.id]).tagged_with(logged_in_member.tag_list, :any => true).latest
    # @same_theme_members = Member.scope_for_without_id_in('members', [logged_in_member.id]).with_shout_tags(logged_in_member.shout_tag_list).latest
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