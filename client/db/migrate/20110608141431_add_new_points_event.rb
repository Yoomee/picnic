class AddNewPointsEvent < ActiveRecord::Migration
  
  def self.up
    PointsEvent::create_defaults!
  end

  def self.down
    # Do nothing
  end
  
end
