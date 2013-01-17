require 'spec_helper'

describe "Photos" do

     
    before do
      create_sample_users
    end
    
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit photos_path        
    end

  
    describe "POST /photos" do
      it "Create photo" do
        visit photos_path
        click_link "New Photo"
        save_and_open_page  
#        user_login("admin@example.com", "admin123")
        fill_in "photo_title", :with  => "Nonsense photo"
        click_button "Create Photo"
        page.should have_content("Nonsense photo")
        page.should have_content("Photo was successfully created.")
      end
    end
    
end
