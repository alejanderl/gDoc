class Participant < ActiveRecord::Base
  attr_accessible :bio, :creator, :name, :image
  has_many :participables
   mount_uploader :image, ImageUploader
  

end
