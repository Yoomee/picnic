Search.class_eval do
  
  def all_members
    (results(:members) + tagged_members).uniq
  end
  
  def tagged_members
    results(:tags).map do |tag|
      Member.tagged_with(tag)
    end.flatten.uniq
  end
  
end
