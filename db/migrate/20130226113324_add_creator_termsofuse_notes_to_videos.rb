class AddCreatorTermsofuseNotesToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :creator, :string
    add_column :videos, :terms_of_use, :string
    add_column :videos, :notes, :string
  end
end
