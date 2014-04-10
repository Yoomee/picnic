class AddNoNotificationEmailsToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :no_notification_emails, :boolean, :default => false
  end

  def self.down
    remove_column :members, :no_notification_emails
  end
end
