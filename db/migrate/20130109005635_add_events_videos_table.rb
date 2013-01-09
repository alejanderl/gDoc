class AddEventsVideosTable < ActiveRecord::Migration
  def change
    create_table :events_videos, :id => false do |t|
      t.integer :event_id
      t.integer :video_id
    end
  end
end
