Tag::FUN_TAGS = %w{lazy boring dull apathetic bland nofriends uninspired loner}
Tag.class_eval do

  include TramlinesImages
  
  search_attributes %w{name}
  
  attr_accessible :description, :image

  named_scope :top_member_tags,
    :select => "tags.*, COUNT(DISTINCT taggings.taggable_id) AS tag_count",
    :joins => "INNER JOIN taggings ON (taggings.tag_id = tags.id)",
    :conditions => "taggings.taggable_type='Member'",
    :group => "tags.id",
    :order => 'tag_count DESC'

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

  named_scope :with_minimum_member_taggings, lambda{|n| {
    :select => "tags.*, COUNT(DISTINCT taggings.taggable_id) AS tag_count",
    :joins => "INNER JOIN taggings ON (taggings.tag_id = tags.id)",
    :conditions => ["taggings.taggable_type='Member' AND tag_count > ?", n],
    :group => "tags.id"
  }}
  
  named_scope :with_name_in, lambda {|names| {
    :conditions => ["name IN (?)", names]
  }}

  named_scope :with_shouts, :joins => ["INNER JOIN taggings ON (taggings.tag_id = tags.id)", "INNER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout')"], :group => "tags.id"
  
  class << self
    
    def create_tag_list(tag_list)
      find_or_create_all_with_like_by_name(ActsAsTaggableOn::TagList.from(tag_list))
    end
    
  end
  
  def official?
    !description.blank?
  end

end
