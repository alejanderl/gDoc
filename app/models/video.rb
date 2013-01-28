class Video < ActiveRecord::Base
  attr_accessible  :date, :description, :duration, :format, :language, :license, :participant_id, :title
  has_and_belongs_to_many :events
 validates_presence_of :title
  
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates
  has_many :favourites, :as => :favouritable, :dependent => :destroy

end
