BlogPostCategory.class_eval do
  
  named_scope :non_projects, :conditions => {:is_project => false}
  named_scope :projects, :conditions => {:is_project => true}
  
end
