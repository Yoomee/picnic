class AddReferredFriendPointsEvent < ActiveRecord::Migration
  
  def self.up
    PointsEvent.create!(:name => "Referring a friend", :points => 5, :slug => 'referred_friend')
  end

  def self.down
    PointsEvent.find_by_slug('referred_friend').destroy
  end
  
end
