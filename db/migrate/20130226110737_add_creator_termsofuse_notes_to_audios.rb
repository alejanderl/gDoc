class AddCreatorTermsofuseNotesToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :creator, :string
    add_column :audios, :terms_of_use, :string
    add_column :audios, :notes, :string

  end
end
