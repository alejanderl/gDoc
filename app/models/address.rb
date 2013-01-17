class Address < ActiveRecord::Base
  attr_accessible :addresable_type, :address, :addressable_id, :city, :country, :postcode
  belongs_to :addressable, :polymorphic => true 

end
