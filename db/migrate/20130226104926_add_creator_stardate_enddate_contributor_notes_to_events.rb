class AddCreatorStardateEnddateContributorNotesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :creator, :string
    add_column :events, :contributor, :string
    add_column :events, :notes, :string
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date

  end
end
