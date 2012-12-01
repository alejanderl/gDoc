class AddDocumentIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :document_id, :integer

  end
end
