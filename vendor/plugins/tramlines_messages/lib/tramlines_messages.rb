module TramlinesMessages

  def self.included(klass)
    Member.send(:include, TramlinesMessages::MemberExtensions)
    Notifier.send(:include, TramlinesMessages::NotifierExtensions)
  end

end