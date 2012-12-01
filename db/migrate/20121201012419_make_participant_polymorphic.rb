class MakeParticipantPolymorphic < ActiveRecord::Migration
  def up
     add_column :participants, :participantable_type, :string
     add_column :participants, :participantable_id, :integer
  end

  def down
     remove_column :participants, :participantable_type
     remove_column :participants, :participantable_id

  end
end
