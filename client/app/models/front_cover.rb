class FrontCover < ActiveRecord::Base

  include TramlinesImages

  #after_validation :update_activation
  
  validates_presence_of :image, :main_story_background_color,
    :main_story_link_text,
    :main_story_link_url, 
    :main_story_text, 
    :main_story_title, 
    :name, 
    :small_story1_link_text, 
    :small_story1_link_url, 
    :small_story1_text, 
    :small_story1_title, 
    :small_story2_link_text, 
    :small_story2_link_url, 
    :small_story2_text, 
    :small_story2_title, 
    :small_story3_link_text, 
    :small_story3_link_url, 
    :small_story3_text, 
    :small_story3_title

  validates_uniqueness_of :name
  
  named_scope :active, :conditions => {:activated => true}

  class << self
    
    def default
      FrontCover.new(FrontCover::DEFAULT_ATTRIBUTES)
    end

  end
  
  def activate!
    update_attributes!(:activated => true)
  end
  
  def deactivate!
    update_attributes!(:activated => false)
  end

  private
  def update_activation
    # Deactivate other front cover if active - in theory there should only be one of these
    self.class::active.each {|front_cover| front_cover.update_attribute(:activated, false)} if changes['activated'] == [false, true]
  end
  
end

FrontCover::DEFAULT_ATTRIBUTES = {
    :main_story_link_url => '/adam-greenfield',
    :main_story_small_heading => 'PICNIC FESTIVAL 2011',
    :main_story_subtitle => 'Founder and managing director, Urbanscale',
    :main_story_text => "Adam Greenfield is founder and managing director of urban systems design practice Urbanscale LLC. Author of Everyware: The dawning age of ubiquitous computing (2006), the forthcoming The City Is Here For You To Use and, with Mark Shepard, co-author of the inaugural Situated Technologies pamphlet Urban Computing and its Discontents (2007), Adam was previously Nokia's head of design direction for service and user interface. He lives and works in New York City with his wife, artist Nurri Kim.",
    :main_story_title => 'Presenting Adam Greenfield',
    :small_story1_link_url => '/picnic11-speakers',
    :small_story1_text => 'Look who else is talking at PICNIC Festival 2011.',
    :small_story1_title => 'Speakers',
    :small_story2_link_url => '/welcome-1',
    :small_story2_text => 'Who will be there, workshops, labs and what great food will be served.',
    :small_story2_title => 'Festival',
    :small_story3_link_text => 'Join Now!',
    :small_story3_link_url => '/club',
    :small_story3_text => "Meet and mingle will all people and speakers attending the festival? Get access to people and unique content",
    :small_story3_title => 'Join the club!'
}
