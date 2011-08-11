class Subscription < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :attachable, :polymorphic => true
  
  named_scope :for_members, :conditions => {:attachable_type => "Member"}
  named_scope :for_tags, :conditions => {:attachable_type => "Tag"}  
  
end