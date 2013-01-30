class Participant < ActiveRecord::Base
  attr_accessible :bio, :creator, :name, :image, :tag_list
  has_many :participables
  mount_uploader :image, ImageUploader

  acts_as_taggable  

  has_many :favourites, :as => :favouritable, :dependent => :destroy


end
