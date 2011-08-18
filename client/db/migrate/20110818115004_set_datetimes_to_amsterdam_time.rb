class SetDatetimesToAmsterdamTime < ActiveRecord::Migration
  
  def self.up
    Page.transaction do
      Page.all.each do |page|
        page.expires_on = page.expires_on - 1.hour
        page.publish_on = page.publish_on - 1.hour
        page.save!
      end
      ConferenceSession.all.each do |conference_session|
        conference_session.starts_at = conference_session.starts_at - 1.hour
        conference_session.ends_at = conference_session.ends_at - 1.hour
        conference_session.save!
      end
    end
  end

  def self.down
    
  end
  
end
