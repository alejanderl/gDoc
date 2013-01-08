class RemoveEventIdFromCycles < ActiveRecord::Migration
  def up
    
    remove_column :cycles, :event_id
    
  end
end
