class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :description

      t.timestamps
    end
  end
end
