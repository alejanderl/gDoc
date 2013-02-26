class AddCreatorTermsofuseNotesToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :creator, :string
    add_column :photos, :terms_of_use, :string
    add_column :photos, :notes, :string
  end
end
