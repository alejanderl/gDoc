class CreateTerms < ActiveRecord::Migration
  def change

    create_table :terms do |t|
      t.string :name
      t.integer :parent_id
      t.string :taxonomy_name

      t.timestamps
    end
  end
end
