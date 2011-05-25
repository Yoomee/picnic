ActsAsTaggableOn::Tagging.class_eval do
  
  private
  def delete_tag
    tag.destroy unless !tag.taggings.empty? || tag.to_tag.official?
  end
  
end