class Photo < ActiveRecord::Base
  attr_accessible :image, :date, :description, :format, :license,  :title
  validates_presence_of :title

  has_and_belongs_to_many :events
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates
  has_many :favourites, :as => :favouritable, :dependent => :destroy

  mount_uploader :image, ImageUploader
  before_create :assign_user
  
  private
  
  def assign_user
    self.user_id = current_user.id
  end
 

end
