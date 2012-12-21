require 'spec_helper'

  describe "GET /cycles" do
    it "display cycles" do
      cycle = FactoryGirl.create(:cycle)
      visit cycles_path
      page.should have_content("Cycle 1")
    end

  describe "POST /cycles" do

    it "signs me in" do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'user_email', :with => "user@example.com"
      fill_in 'user_password', :with => "lalala"
      click_link_or_button 'Sign in'

  end


    it "Create cycles" do
      visit cycles_path
      save_and_open_page
      click_link "New Cycle"
      fill_in "cycle_title", :with  => "Cycle 1"
      click_button "Create Cycle"
      page.should have_content("Cycle 1")
      page.should have_content("Cycle was successfully created.")

    end

    it "update cycles" do
      cycle = FactoryGirl.create(:cycle)
      visit "/cycles/1"
      click_link "Edit"
#      save_and_open_page

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
