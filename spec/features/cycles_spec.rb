require 'spec_helper'
  
describe "GET /cycles" do
  
  before do
    user = FactoryGirl.create(:user)  
    visit new_user_session_path  
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => "secret"
    click_button "Sign in"
  end

  it "display cycles" do
    cycle = FactoryGirl.create(:cycle)
    visit cycles_path
    page.should have_content("Cycle 1")
  end

    it "Each cycle shows events associated to it" do
      cycle = FactoryGirl.create(:cycle)
      event = FactoryGirl.create(:event)
      visit "/cycles/1"
      save_and_open_page
      visit cycles_path
      save_and_open_page
      page.should have_content("Event")

    end


  describe "POST /cycles" do
    before do
      cycle = FactoryGirl.create_list(:cycle, 8)
      
    end
 
   it "Create cycles" do
      visit cycles_path
<<<<<<< HEAD
=======
#      save_and_open_page
>>>>>>> continue with cycles tests
      click_link "New Cycle"
      #save_and_open_page
      fill_in "cycle_title", :with  => "Geek-art"
      click_button "Create Cycle"
      page.should have_content("Geek-art")
      page.should have_content("Cycle was successfully created.")

    end

    it "update cycles" do
      cycle = FactoryGirl.create(:cycle)
      visit "/cycles/1"
      click_link "Edit"
      # save_and_open_page
      fill_in "cycle_title", :with  => "Geek-art 2"
      click_button "Update Cycle"

      page.should have_content("Geek-art 2")
      page.should have_content("Cycle was successfully updated")

    end

    it "destroy cycles" do
       save_and_open_page
      cycle = FactoryGirl.create(:cycle)
      visit "/cycles"
      click_link "Destroy"
    end
<<<<<<< HEAD
    it "Select date from calender / datepicker" do
      visit "/cycles/1"
      click_link "Edit"
#      click_field "date"

    end

    pending "check taxonomy fiedl" do 
      page.should have_content "taxonomy"
#      fill_in 

    end

 end

=======
  end
>>>>>>> continue with cycles tests

end
