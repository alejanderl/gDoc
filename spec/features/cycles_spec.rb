require 'spec_helper'

describe "GET /cycles" do

  before do
    create_sample_cycles
    create_sample_users
 end

  it "display cycles" do
    visit cycles_path
    page.should_not have_content("New Cycle")
    page.should have_content("Cycle 1")
  end

   pending  it "Each cycle shows events associated to it" do
      visit "/cycles/1"
#      save_and_open_page
      visit cycles_path
      page.should have_content("Event")

    end

  describe "POST /cycles" do
   before do
    create_sample_cycles
    create_sample_users
    create_sample_tags
  end

 
   it "Create cycles" do
      user_login("admin@example.com", "admin123")
      visit cycles_path
#     save_and_open_page
      click_link "New Cycle"
      fill_in "cycle_title", :with  => "Geek-art"
      fill_in "cycle_tag_list", :with => "art"
      click_button "Create Cycle"
      page.should have_content("Geek-art")
      page.should have_content("Cycle was successfully created.")

    end

  it "Update cycles" do
      user_login("admin@example.com", "admin123")
      visit "/cycles/1"
      click_link "Edit"
#      save_and_open_page
      find_field('cycle_title').value
      fill_in "cycle_title", :with  => "Geek-art 2"
      click_button "Update Cycle"
      page.should have_content("Geek-art 2")
      page.should have_content("Cycle was successfully updated")

    end

   it "destroy cycles" do
      user_login("admin@example.com", "admin123")
      visit "/cycles"
      page.should have_content("Cycle 1") {
#        alert = page.driver.browser.switch_to.alert
#        expect { alert.accept }.to change(Cycle, :count).by(-1)}
        expect { click_link('Destroy') }.to change(Cycle, :count).by(-1)}
    end


    pending it "Select date from calender / datepicker" do
      visit "/cycles/1"
      click_link "Edit"
    end

    pending "check taxonomy fiedl" do 
      page.should have_content "taxonomy"
    end

#    it "click on a tag a get a filtered list of cycles with that tag" do
#        visit cycles_path
#        save_and_open_page
#        page.should have_content "e-textile"
#        click_link "e-textile"
#        visit "/tags/e-textile"
#        page.should_not have_content "Cycle 2"
#    end

 end




end
