class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.string :header
      t.string :broadcast
      t.string :storage
      t.string :footer
      t.string :image

      t.timestamps
    end
  end
end
