class Photo < ActiveRecord::Base
  attr_accessible :date, :description, :format, :license,  :title
  belongs_to :event
  
  has_many :participates, :as => :participable
  
  has_many :participants, :through => :participates
 

end
