module TramlinesShouts::TagExtensions
   
  def self.included(klass)
    klass.named_scope :for_shouts_by_member, lambda {|member| {:joins => "INNER JOIN taggings ON taggings.tag_id=tags.id INNER JOIN shouts ON shouts.id=taggings.taggable_id", :conditions => ["taggings.taggable_type='Shout' AND shouts.member_id = ?", member.id], :group => "tags.id"}}
    klass.named_scope :with_shouts, :joins => ["INNER JOIN taggings ON (taggings.tag_id = tags.id)", "INNER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout')"], :group => "tags.id"    
    klass.named_scope :top_tags, 
      :select => "tags.*, (COUNT(DISTINCT shouts.id) + COUNT(DISTINCT wall_posts.id)) AS tag_count", 
      :joins => "INNER JOIN taggings ON (taggings.tag_id = tags.id) INNER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout') LEFT OUTER JOIN walls ON (walls.attachable_type = 'Shout' AND walls.attachable_id = shouts.id) LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)",
      :group => "tags.id",
      :order => "tag_count DESC"
    klass.named_scope :top_tags_since, lambda{|date| { 
        :select => "tags.*, (COUNT(DISTINCT shouts.id) + COUNT(DISTINCT wall_posts.id)) AS tag_count", 
        :joins => "INNER JOIN taggings ON (taggings.tag_id = tags.id AND taggings.created_at >= '#{date.to_date}') INNER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout') LEFT OUTER JOIN walls ON (walls.attachable_type = 'Shout' AND walls.attachable_id = shouts.id) LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)",
        :group => "tags.id",
        :order => "tag_count DESC"
      }}
  end

  def shouts
    Shout.tagged_with(name).scope_for_group_by_id("shouts")
  end

end