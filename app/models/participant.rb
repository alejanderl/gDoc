class Participant < ActiveRecord::Base
  attr_accessible :bio, :creator, :name, :image, :tag_list, :surname, :web
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :participables
  mount_uploader :image, ImageUploader

  acts_as_taggable
  has_many :favourites, :as => :favouritable, :dependent => :destroy
#  has_many :participables
  mount_uploader :image, ImageUploader
  acts_as_taggable  
  has_many :favourites, :as => :favouritable, :dependent => :destroy

  belongs_to :participate, :polymorphic => true
  has_many :addresses, :as => :addressable


end
