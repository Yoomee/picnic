Tag.class_eval do
  
  include TramlinesImages
  
  attr_accessible :description, :image

  named_scope :with_shouts, :joins => ["INNER JOIN taggings ON (taggings.tag_id = tags.id)", "INNER JOIN shouts ON (shouts.id = taggings.taggable_id AND taggings.taggable_type = 'Shout')"], :group => "tags.id"

  class << self
    
    def create_tag_list(tag_list)
      find_or_create_all_with_like_by_name(ActsAsTaggableOn::TagList.from(tag_list))
    end
    
  end
  
end