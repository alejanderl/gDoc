class Appearance < ActiveRecord::Base
  attr_accessible :broadcast, :footer, :header, :image, :storage
  mount_uploader :image, ImageUploader
end
