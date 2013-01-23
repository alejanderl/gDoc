class Event < ActiveRecord::Base
  attr_accessible :cycle_ids, :date, :description, :participant_id, :time, :title, :tag_list
  has_and_belongs_to_many :cycles
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :audios
  has_and_belongs_to_many :photos
  has_and_belongs_to_many :documents
  has_many :addresses, :as => :addressable
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates
  validates_presence_of :title 
  acts_as_taggable
end
