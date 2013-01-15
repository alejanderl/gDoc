class ReplaceSomeStringFieldsWithTextFields < ActiveRecord::Migration
 def up
    change_column :participants, :bio, :text
    change_column :videos, :description, :text
    change_column :audios, :description, :text
    change_column :photos, :description, :text
   change_column :events, :description, :text
   change_column :cycles, :description, :text
   change_column :documents, :description, :text
  end


end
