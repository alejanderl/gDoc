require 'spec_helper'

  describe "GET /documents" do
  
  before do
    create_sample_cycles
    create_sample_users
    I18n.default_locale = :en
    create_sample_documents({:title => "Document number 1",:description => "Description document number 1"})

    50.times do
      create_sample_documents
    end   
  end
    
    it "display documents index" do
      visit documents_path
#    save_and_open_page
      page.should have_content("Document number 1")
    end
    
  describe "POST /events" do 
    it "Create a document" do
      user_login("admin@example.com", "admin123")
      visit documents_path
      click_link "New Document"
      fill_in "document_title", :with  => "Document handmande"
      fill_in "document_description", :with  => "Description handmade"
      
#      save_and_open_page
      click_button "Create Document"
      page.should have_content("Document was successfully created.")
#     save_and_open_page
    end
    pending it "Associate a document to an event" do

    end

    it "Update a document" do
      user_login("admin@example.com", "admin123")
      visit documents_path
      page.all(".name")[1].first("a").click

      click_link "Edit"
      fill_in "document_title", :with  => "Modify"
      fill_in "document_description", :with  => "Modified description"
     
      click_button "Update Document" 
      page.should have_content("Document was successfully updated.")
#     save_and_open_page
    end

  end



end
