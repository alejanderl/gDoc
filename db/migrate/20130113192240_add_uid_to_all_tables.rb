class AddUidToAllTables < ActiveRecord::Migration
  def change
    add_column :audios, :uid, :string
    add_column :cycles, :uid, :string
    add_column :documents, :uid, :string
    add_column :events, :uid, :string
    add_column :participants, :uid, :string
    add_column :photos, :uid, :string
    add_column :videos, :uid, :string
  end
end
