WallPost.class_eval do
  
  after_create :trigger_points_event

  belongs_to :removed_by, :class_name => "Member"
  
  def removed
    !removed_at.blank?
  end
  alias_method :removed?, :removed
  
  def text
    return read_attribute(:text) if !removed?
    remover = (removed_by == member)? "the user" : "a moderator"
    "This comment has been removed by #{remover}." 
  end
  
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