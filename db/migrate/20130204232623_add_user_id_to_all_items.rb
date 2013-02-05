class AddUserIdToAllItems < ActiveRecord::Migration
  def change
    add_column :events, :user_id, :integer
    add_column :videos, :user_id, :integer
    add_column :audios, :user_id, :integer
    add_column :documents, :user_id, :integer
    add_column :participants, :user_id, :integer
    add_column :photos, :user_id, :integer
    add_column :cycles, :user_id, :integer
  end
end
