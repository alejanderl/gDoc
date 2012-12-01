class Event < ActiveRecord::Base
  attr_accessible :cycle_id, :date, :description, :participant_id, :time, :title
  belongs_to :cycle
  has_many :audios
  has_many :videos
  has_many :photos
  has_many :documents
  has_many :participants, :as => :participantable, :dependent =>:destroy


end
