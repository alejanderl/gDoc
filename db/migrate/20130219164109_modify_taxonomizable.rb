class ModifyTaxonomizable < ActiveRecord::Migration
  def up
    remove_column :taxonomizables, :keyword_id
    remove_column :taxonomizables, :keyword_type
    add_column :taxonomizables, :term_id, :integer
    add_column :taxonomizables, :term_type, :string
  end

  def down
  end
end
