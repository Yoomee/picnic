BlogPost.class_eval do
  
  acts_as_taggable
  
  class << self

    def tags
      all.map(&:tags).flatten.uniq
    end
    
  end
  
end