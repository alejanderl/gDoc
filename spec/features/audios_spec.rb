require 'spec_helper'
  
describe "GET /audios" do
  
  before do
    create_sample_audios
    create_sample_users
 end

  it "display cycles" do
    visit audios_path    
    page.should have_content("Cool audio")
    page.should_not have_content("New Audio")
  end

  describe "POST /cycles" do
#    before do
#    create_sample_cycles
#    create_sample_users
#     end
 
   it "Create audios" do
     user_login("admin@example.com", "admin123")
      visit audios_path
      click_link "New Audio"      
      fill_in "audio_title", :with  => "Geek-art audio"
      click_button "Create Audio"
      page.should have_content("Geek-art audio")
      page.should have_content("Audio was successfully created.")

    end

  it "Update audios" do
      user_login("admin@example.com", "admin123")
      visit "/audios/1"
      click_link "Edit"
     # save_and_open_page
      fill_in "audio_title", :with  => "Geek-art 2"
      click_button "Update Audio"
      page.should have_content("Geek-art 2")
      page.should have_content("Audio was successfully updated")

    end

   it "destroy cycles" do
      user_login("admin@example.com", "admin123")
      visit "/audios/1"
#      save_and_open_page
      page.should have_content("Cool audio") {
          alert = page.driver.browser.switch_to.alert
          click_link('Destroy')
          save_and_open_page
          alert.accept
          save_and_open_page
        }
#        expect { click_link('Destroy') }.to change(Cycle, :count).by(-1)}
#      save_and_open_page
    end

    pending it "Select date from calender / datepicker" do
      visit "/cycles/1"
      click_link "Edit"
#      click_field "date"

    end

    pending "check taxonomy fiedl" do 
      page.should have_content "taxonomy"
#      fill_in 
    end

 end


end
