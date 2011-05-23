Tag.class_eval do
  
  include TramlinesImages
  
  attr_accessible :description, :image

  named_scope :with_shouts, :joins => ["INNER JOIN taggings ON (taggings.tag_id = tags.id)", "INNER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout')"], :group => "tags.id"
  
  named_scope :top_tags, 
    :select => "tags.*, (COUNT(DISTINCT shouts.id) + COUNT(DISTINCT wall_posts.id)) AS tag_count", 
    :joins => "INNER JOIN taggings ON (taggings.tag_id = tags.id) INNER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout') LEFT OUTER JOIN walls ON (walls.attachable_type = 'Shout' AND walls.attachable_id = shouts.id) LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)",
    :group => "tags.id",
    :order => "tag_count DESC"
  
  named_scope :top_tags_since, lambda{|date| { 
    :select => "tags.*, (COUNT(DISTINCT shouts.id) + COUNT(DISTINCT wall_posts.id)) AS tag_count", 
    :joins => "LEFT OUTER JOIN taggings ON (taggings.tag_id = tags.id AND taggings.created_at >= '#{date.to_date}') LEFT OUTER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout') LEFT OUTER JOIN walls ON (walls.attachable_type = 'Shout' AND walls.attachable_id = shouts.id) LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)",
    :group => "tags.id",
    :order => "tag_count DESC"
  }}

  class << self
    
    def create_tag_list(tag_list)
      find_or_create_all_with_like_by_name(ActsAsTaggableOn::TagList.from(tag_list))
    end
    
  end
  
end