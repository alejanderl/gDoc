class Participant < ActiveRecord::Base
  attr_accessible :bio, :creator, :name, :image
  has_many :participables
  mount_uploader :image, ImageUploader
  has_many :favourites, :as => :favouritable, :dependent => :destroy
  before_create :assign_user
  
  private
  
  def assign_user
    self.user_id = current_user.id
  end


end
