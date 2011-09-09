class ConferenceSessionsMember < ActiveRecord::Base  
  belongs_to :member
  belongs_to :conference_session  
  validates_presence_of :member
  
  after_save :bump_my_program_version
  
  private
  def bump_my_program_version
    member.increment!(:my_program_version)
  end
end
