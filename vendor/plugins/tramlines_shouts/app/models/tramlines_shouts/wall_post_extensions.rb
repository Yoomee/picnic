module TramlinesShouts::WallPostExtensions
  
  def self.included(klass)
    klass.has_and_belongs_to_many :notifications
    klass.after_create :notify_other_members
    klass.before_destroy :destroy_notifications    
  end
  
  def shout_recipient
    return nil if attachable.nil?
    attachable.recipient
  end
  
  private
  def notify_other_members
    return true if attachable_type != "Shout"
    recipients = other_members_who_commented
    recipients << attachable_member unless attachable_member.nil?
    recipients << shout_recipient if shout_recipient.is_a?(Member)
    recipients = (recipients - [self.member]).uniq
    recipients.each do |recipient|
      if notification = recipient.notifications.unread.with_wall_posts.for_shout(attachable).first
        notification.wall_posts << self
      else
        notification = recipient.notifications.build(:attachable => attachable, :skip_send_email => true)
        notification.wall_posts << self
        notification.save
      end
      if recipient.send_email_for_shout?(attachable)
        Notifier.deliver_notification_wall_post(notification, self)
      end
    end
  end
  
  def destroy_notifications
    notifications.each do |notification|
      if notification.wall_posts.size == 1
        notification.destroy
      else
        notification.wall_post_ids.delete(self.id)
        notification.save!
      end
    end
  end
  
end