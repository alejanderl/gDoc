class Cycle < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title
  has_and_belongs_to_many :events 
  has_many :cycles, :as => :addressable
  validates_presence_of :title
  has_many :favourites, :as => :favouritable, :dependent => :destroy
  before_create :assign_user
  
  private
  
  def assign_user
    self.user_id = current_user.id
  end

end
