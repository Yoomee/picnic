Tramlines::load_plugins
class ModifyingDeletedPostShoutValue < ActiveRecord::Migration
  
  def self.up
    PointsEvent.modify_points_value!(:deleted_posted_shout, -5)
  end

  def self.down
    PointsEvent.modify_points_value!(:deleted_posted_shout, -10)
  end
  
end
