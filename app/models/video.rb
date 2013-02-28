class Video < ActiveRecord::Base

  attr_accessible  :date, :description, :duration, :format, :language, :license, :participant_id, :title, :tag_list, :terms_of_use, :creator, :notes
  has_and_belongs_to_many :events 
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates

  validates_presence_of :title
  has_many :favourites, :as => :favouritable, :dependent => :destroy
  
  acts_as_taggable
end
