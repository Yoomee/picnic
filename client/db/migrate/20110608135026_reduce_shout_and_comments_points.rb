Tramlines::load_plugins
class ReduceShoutAndCommentsPoints < ActiveRecord::Migration
  
  REDUCTIONS = {
    :post_comment => [5, 3],
    :post_shout => [10, 5]
  }
  
  def self.up
    REDUCTIONS.each do |slug, points_values|
      old_points, new_points = points_values[0], points_values[1]
      points_event = PointsEvent.find_by_slug(slug.to_s)
      puts "Setting #{slug} points value to #{new_points}"
      points_event.update_attribute(:points, new_points)
      points_event.points_transfers.each do |points_transfer|
        points_transfer.update_attribute(:points, new_points)
        points_transfer.member.increment!(:points, new_points - old_points)
      end
    end
  end

  def self.down
    REDUCTIONS.each do |slug, points_values|
      old_points, new_points = points_values[0], points_values[1]
      points_event = PointsEvent.find_by_slug(slug.to_s)
      puts "Setting #{slug} points value to #{old_points}"
      points_event.update_attribute(:points => old_points)
      points_event.points_transfers.each do |points_transfer|
        points_transfer.update_attribute(:points, old_points)
        points_transfer.member.increment!(:points, old_points - new_points)
      end
    end
    
  end
end
