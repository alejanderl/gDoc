class AddEventIdToCycles < ActiveRecord::Migration
  def change
    add_column :cycles, :event_id, :integer

  end
end
