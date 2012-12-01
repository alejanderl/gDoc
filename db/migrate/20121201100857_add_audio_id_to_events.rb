class AddAudioIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :audio_id, :integer
  end
end
