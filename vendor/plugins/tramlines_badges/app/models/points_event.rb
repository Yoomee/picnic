class PointsEvent < ActiveRecord::Base
  
  validates_presence_of :slug, :name, :points
  
  has_many :points_transfers

  class << self
    
    def find_by_slug(slug_name)
      if points_event = find(:first, :conditions => {:slug => slug_name.to_s})
        points_event
      elsif attrs = PointsEvent::SLUG_POINTS[slug_name.to_sym]
        create(attrs.merge(:slug => slug_name.to_s))
      end
    end
    
    def modify_points_value!(slug, new_value)
      if points_event = find(:first, :conditions => {:slug => slug.to_s})
        points_event.modify_points_value!(new_value)
      end
    end
    
  end

  def modify_points_value!(new_value)
    puts "Setting #{slug} points value to #{new_value}"
    old_value = points
    update_attribute(:points, new_value)
    points_transfers.each do |points_transfer|
      points_transfer.update_attribute(:points, new_value)
      points_transfer.member.increment!(:points, new_value - old_value)
    end
  end
    
end

# overwrite in client
PointsEvent::SLUG_POINTS = {
  :register => {:name => "Registering for the first time", :points => 2},
  :rate_shout => {:name => "Rating someone else's discussion", :points => 1},
  :share_shout => {:name => "Sharing a discussion (by email, Facebook or Twitter)", :points => 2},
  :post_comment => {:name => "Adding a comment to a discussion", :points => 3},
  :post_shout => {:name => "Posting a new discussion", :points => 5},
  :like_my_shout => {:name => "Having your discussion \"thumbed up\"", :points => 1},
  :dislike_my_shout => {:name => "Having your discussion \"thumbed down\"", :points => -1},
  :first_comment_on_my_shout => {:name => "Having comments on your discussion", :points => 2},
  :share_my_shout => {:name => "Having your discussion shared by others", :points => 5},
  :friend_on_fb => {:name => "Having friends on Facebook also on PICNIC", :points => 5}, 
  :like_my_profile => {:name => "Having your profile \"thumbed up\"", :points => 2},
  :deleted_posted_shout => {:name => "Deleting a discussion", :points => -10},
  :set_real_me_tags => {:name => "Set 'About the real me'", :points => 4},
  :friend => {:name => "Sitting on someone's blanket", :points => 2}
}