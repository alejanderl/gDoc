class AddVideoIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :video_id, :integer

  end
end
