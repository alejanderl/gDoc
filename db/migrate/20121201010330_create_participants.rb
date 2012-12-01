class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :bio
      t.boolean :creator

      t.timestamps
    end
  end
end
