class AddImageToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :image, :string
  end
end
