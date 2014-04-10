class Connection

  attr_reader :member
  
  class << self
    
    def get_for(member, options = {})
      args_for_initialize(member, options).map {|args| new(*args)}
    end
    
    private
    # Subclasses should define an args_for_initialize(member, excluded_members)
    # method here, which will return
    # an array of args arrays to be passed to initialize.
    
  end
  
  def name
    self.class.to_s.gsub(/Connection$/, '').underscore
  end
  
end