class AddCreatorTermsofuseNotesToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :creator, :string
    add_column :documents, :terms_of_use, :string
    add_column :documents, :notes, :string
  end
end
