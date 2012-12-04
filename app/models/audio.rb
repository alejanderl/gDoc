class Audio < ActiveRecord::Base
  
  attr_accessible :participant_attributes, :date, :description, :duration, :format, :language, :license, :participant_id, :title
  belongs_to :event
  
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates

end
