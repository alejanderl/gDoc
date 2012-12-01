class RenamePersonInAllTables < ActiveRecord::Migration

  def change
    rename_column :events, :person_id, :participant_id
    rename_column :audios, :person_id, :participant_id
    rename_column :videos, :person_id, :participant_id
    rename_column :photos, :person_id, :participant_id
    rename_column :documents, :person_id, :participant_id

  end

end
