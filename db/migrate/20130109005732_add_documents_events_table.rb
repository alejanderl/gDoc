class AddDocumentsEventsTable < ActiveRecord::Migration
  def change
    create_table :documents_events, :id => false do |t|
      t.integer :document_id
      t.integer :event_id
    end
  end

end
