class AddRatePagePointsEvent < ActiveRecord::Migration
  
  def self.up
    PointsEvent.create!(:slug => 'rate_page', :name => "Liking a story", :points => 1)
  end

  def self.down
    PointsEvent.find_by_slug('rate_page').destroy
  end
end
