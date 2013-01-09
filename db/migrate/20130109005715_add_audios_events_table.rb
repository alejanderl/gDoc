class AddAudiosEventsTable < ActiveRecord::Migration
def change
    create_table :audios_events, :id => false do |t|
      t.integer :audio_id
      t.integer :event_id
    end
  end
end
