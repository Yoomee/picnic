module TramlinesContentFlags
  
  def self.included(klass)
    Formtastic::SemanticFormBuilder.send(:include, TramlinesContentFilter::SemanticFormBuilderExtensions)
    Member.send(:include, TramlinesContentFilter::MemberExtensions)
    Notifier.send(:include, TramlinesContentFlags::NotifierExtensions)
  end
  
end
