class Participant < ActiveRecord::Base
  attr_accessible :bio, :creator, :name
  belongs_to :participantable, :polymorphic => true

end
