class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.date :date
      t.string :description
      t.string :license
      t.string :format
      t.integer :person_id

      t.timestamps
    end
  end
end
