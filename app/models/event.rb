class Event < ActiveRecord::Base
  
 

  attr_accessible :cycle_ids, :date, :description, :participant_id, :time, :title, :tag_list, :creator, :contributor, :start_date, :end_date, :notes
  validates_presence_of :title, :description
  has_and_belongs_to_many :cycles
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :audios
  has_and_belongs_to_many :photos
  has_and_belongs_to_many :documents
  has_many :addresses, :as => :addressable
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates

  acts_as_taggable
  has_many :favourites, :as => :favouritable, :dependent => :destroy
  
  has_many :taxonomizables, :as => :item, :dependent => :destroy
  has_many :terms, :through => :taxonomizables
  
  default_scope includes(:audios, :videos, :documents, :photos, :cycles)
  
  def related_objects
   
    
  end

end
