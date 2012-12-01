class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :description
      t.integer :person_id
      t.integer :cycle_id

      t.timestamps
    end
  end
end
