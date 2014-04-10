module TramlinesContentFilter::MemberExtensions
  
  def self.included(klass)
    klass.content_filter(:forename, :surname, :bio)
    # Flaggings that this member has raised
    klass.has_many :member_flaggings, :class_name => "ContentFlagging"
    klass.named_scope :top_flaggers, :select => "members.*, COUNT(content_flaggings.id) AS content_flaggings_count", :joins => "INNER JOIN content_flaggings ON (members.id = content_flaggings.member_id)", :group => "members.id", :order => "content_flaggings_count DESC"
    klass.named_scope :most_flagged, :select => "members.*, COUNT(DISTINCT content_flaggings.id) AS flag_count", :joins => "INNER JOIN shouts ON (shouts.member_id = members.id) INNER JOIN wall_posts ON (wall_posts.member_id = members.id) INNER JOIN content_flags ON ((content_flags.attachable_type = 'Shout' AND content_flags.attachable_id = shouts.id) OR (content_flags.attachable_type = 'WallPost' AND content_flags.attachable_id = wall_posts.id)) INNER JOIN content_flaggings ON (content_flaggings.content_flag_id = content_flags.id)", :group => "members.id", :order => "flag_count DESC"
  end

end
