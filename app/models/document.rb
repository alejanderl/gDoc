class Document < ActiveRecord::Base
  attr_accessible :participant_attributes, :date, :description, :format, :language, :license, :participant_id, :title
  belongs_to :event
  has_many :participant, :as => :participantable, :dependent =>:destroy 
  accepts_nested_attributes_for :participant

end
