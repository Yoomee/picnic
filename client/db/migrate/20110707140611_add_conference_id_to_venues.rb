class AddConferenceIdToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :conference_id, :integer
    if conference = Conference.first
      Venue.all.each do |venue|
        venue.update_attribute(:conference_id, conference.id) if venue.conference_id.blank?
      end
    end
  end

  def self.down
    remove_column :venues, :conference_id, :integer
  end
end
