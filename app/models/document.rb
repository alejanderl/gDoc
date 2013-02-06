class Document < ActiveRecord::Base
  attr_accessible :participant_attributes, :date, :description, :format, :language, :license, :participant_id, :title
  has_and_belongs_to_many :events
  has_many :participates, :as => :participable 
  has_many :participants, :through => :participates
  has_many :favourites, :as => :favouritable, :dependent => :destroy
  


end
