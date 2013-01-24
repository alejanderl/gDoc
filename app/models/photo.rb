class Photo < ActiveRecord::Base
  attr_accessible :image, :date, :description, :format, :license,  :title, :tag_list
  has_and_belongs_to_many :events
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates
  mount_uploader :image, ImageUploader
  acts_as_taggable

end
