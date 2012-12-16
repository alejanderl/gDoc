require 'spec_helper'

  describe "GET /cycles" do
    it "display cycles" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
       cycle = FactoryGirl.create(:cycle)
#      cycles = Factory(:cycle)
#      Cycle.create!(:title => "Geek-art")
      visit cycles_path
      page.should have_content("Geek-art")
    end

  describe "POST /cycles" do
    it "Create cycles" do
      visit cycles_path
      click_link "New Cycle"
      fill_in "cycle_title", :with  => "Geek-art"
      click_button "Create Cycle"
      page.should have_content("Geek-art")
      page.should have_content("Cycle was successfully created.")

    end
 end

  describe "POST /cycles/1" do
    it "update cycles" do
      cycle = FactoryGirl.create(:cycle)
      visit "/cycles/1"
      click_link "Edit"

      save_and_open_page

      fill_in "cycle_title", :with  => "Geek-art 2"
      click_button "Update Cycle"

      page.should have_content("Geek-art 2")
      page.should have_content("Cycle was successfully updated")

    end
 end


end
