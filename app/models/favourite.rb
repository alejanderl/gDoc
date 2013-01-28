class Favourite < ActiveRecord::Base
  attr_accessible :favouritable_type, :favouritable_id
  
  
  belongs_to :favouritable, :polymorphic => true
  belongs_to :user 
  
end