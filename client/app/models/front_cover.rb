class FrontCover < ActiveRecord::Base
  
  validates_presence_of :main_story_link_text,
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
  
  include TramlinesImages
  
end
