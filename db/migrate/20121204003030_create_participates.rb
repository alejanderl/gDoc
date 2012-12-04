class CreateParticipates < ActiveRecord::Migration
  def change
    create_table :participates do |t|
      t.integer :paricipant_id
      t.integer :participable_id
      t.string :participable_type

      t.timestamps
    end
  end
end
