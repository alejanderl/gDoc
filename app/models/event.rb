class Event < ActiveRecord::Base
  attr_accessible :cycle_id, :date, :description, :participant_id, :time, :title
  belongs_to :cycle
  has_many :audios
  has_many :videos
  has_many :photos
  has_many :documents
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates
  validates_presence_of :title
end
