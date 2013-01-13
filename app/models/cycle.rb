class Cycle < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title, :tag_list
  has_and_belongs_to_many :events 
  has_many :cycles, :as => :addressable
  validates_presence_of :title
  acts_as_taggable

end
