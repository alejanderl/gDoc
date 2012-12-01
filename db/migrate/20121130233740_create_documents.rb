class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.date :date
      t.string :description
      t.string :license
      t.string :format
      t.string :language
      t.integer :person_id

      t.timestamps
    end
  end
end
