class AddCyclesEventsTable < ActiveRecord::Migration
  def change
    create_table :cycles_events, :id => false do |t|
      t.integer :cycle_id
      t.integer :event_id
    end
  end
end
