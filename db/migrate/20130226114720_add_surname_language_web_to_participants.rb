class AddSurnameLanguageWebToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :surname, :string
    add_column :participants, :language, :string
    add_column :participants, :web, :string
  end
end
