class Participate < ActiveRecord::Base
  
  belongs_to :participant
  belongs_to :participable , :polymorphic => true
  
  end
