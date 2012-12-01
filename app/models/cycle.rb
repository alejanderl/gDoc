class Cycle < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title
  has_many :events 

end
