class FrontCover < ActiveRecord::Base

  include TramlinesImages

  #after_validation :update_activation
  
  validates_presence_of :main_story_background_color,
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
