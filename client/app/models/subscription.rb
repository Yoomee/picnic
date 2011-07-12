class Subscription < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :attachable, :polymorphic => true
  
end