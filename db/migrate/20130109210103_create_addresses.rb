class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :postcode
      t.string :city
      t.string :country
      t.integer :addressable_id
      t.string :addresable_type

      t.timestamps
    end
  end
end
