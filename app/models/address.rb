class Address < ActiveRecord::Base
  attr_accessible  :address, :city, :country, :postcode
  belongs_to :addressable, :polymorphic => true 

end
