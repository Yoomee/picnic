module TramlinesBadges
  
  def self.included(klass)
    Member.send(:include, TramlinesBadges::MemberExtensions)
  end
  
end
