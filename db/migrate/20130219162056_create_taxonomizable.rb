class CreateTaxonomizable < ActiveRecord::Migration
  def up
    create_table :taxonomizables do |t|
      t.integer :keyword_id
      t.integer :item_id
      t.string :keyword_type
      t.timestamps
     end
     
  end

  def down
  end
end
