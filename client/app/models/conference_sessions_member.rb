class ConferenceSessionsMember < ActiveRecord::Base  
  belongs_to :member
  belongs_to :conference_session  
  validates_presence_of :member
  
  after_create :bump_my_program_version
  after_destroy :bump_my_program_version
  
  private
  def bump_my_program_version
    member.increment!(:my_program_version)
  end
end
