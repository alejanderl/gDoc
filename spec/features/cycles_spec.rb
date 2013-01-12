require 'spec_helper'

 
   
describe "GET /cycles" do
  user = FactoryGirl.create(:user)  
  before do
    visit new_user_session_path  
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => "secret"
   
    click_button "Sign in"
    save_and_open_page

   
  end
  
  it "display cycles" do
    cycle = FactoryGirl.create(:cycle)
    visit cycles_path
    page.should have_content("Cycle 1")
  end

  describe "POST /cycles" do
    it "Create cycles" do
      visit cycles_path
      click_link "New Cycle"
      #save_and_open_page
      fill_in "cycle_title", :with  => "Geek-art"
      click_button "Create Cycle"
      page.should have_content("Geek-art")
      page.should have_content("Cycle was successfully created.")

    end

    it "update cycles" do
      cycle = FactoryGirl.create_list(:cycle,8)
      visit "/cycles/1"
      click_link "Edit"
      # save_and_open_page
      fill_in "cycle_title", :with  => "Geek-art 2"
      click_button "Update Cycle"

      page.should have_content("Geek-art 2")
      page.should have_content("Cycle was successfully updated")

    end

    it "destroy cycles" do
      cycle = FactoryGirl.create(:cycle)
      visit "/cycles"
      click_link "Destroy"
    end
 end


end
