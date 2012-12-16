class Photo < ActiveRecord::Base
  attr_accessible :image, :date, :description, :format, :license,  :title
  belongs_to :event
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates
  mount_uploader :image, ImageUploader
 

end
