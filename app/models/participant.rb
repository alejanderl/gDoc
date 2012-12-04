class Participant < ActiveRecord::Base
  attr_accessible :bio, :creator, :name
  has_many :participables
  

end
