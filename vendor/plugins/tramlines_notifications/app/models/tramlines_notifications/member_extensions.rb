module TramlinesNotifications::MemberExtensions
  
  def self.included(klass)
    klass.has_many :notifications, :dependent => :destroy
  end
  
end