class AddCreatorContributorNotesToCycles < ActiveRecord::Migration
  def change
    add_column :cycles, :creator, :string
    add_column :cycles, :contributor, :string
    add_column :cycles, :notes, :string
  end
end
