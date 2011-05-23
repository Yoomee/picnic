WallPost.class_eval do
  
  after_create :trigger_points_event
  
  private
  def trigger_points_event(options = {})
    return true if attachable_type != "Shout"
    if attachable.wall_posts.member_id_is_not(attachable_member.id).count == 1
      attachable_member.handle_points_event(:first_comment_on_my_shout, self, options)
    end
    member.handle_points_event(:post_comment, self, options)
    member.handle_badge_trigger(:comments)
  end
  
end