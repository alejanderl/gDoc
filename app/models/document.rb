class Document < ActiveRecord::Base
  attr_accessible :participant_attributes, :date, :description, :format, :language, :license, :participant_id, :title
  belongs_to :event
  has_many :participates, :as => :participable 
  has_many :participants, :through => :participates

end
