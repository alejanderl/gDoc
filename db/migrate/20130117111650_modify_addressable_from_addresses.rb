class ModifyAddressableFromAddresses < ActiveRecord::Migration
  def up
    remove_column :addresses, :addresable_type
    add_column :addresses, :addressable_type, :string
  end


end
