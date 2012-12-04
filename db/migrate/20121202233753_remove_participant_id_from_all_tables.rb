class RemoveParticipantIdFromAllTables < ActiveRecord::Migration
  def up


    remove_column :audios, :participant_id
    remove_column :events, :participant_id
    remove_column :videos, :participant_id
    remove_column :documents, :participant_id
    remove_column :participants,[:participantable_id, :participantable_type]
    remove_column :photos, :participant_id

  end


end
