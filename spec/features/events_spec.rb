require 'spec_helper'

  describe "GET /events" do

  before do
    create_sample_cycles
    create_sample_users
    create_sample_events
  end
    
    it "display events index" do
      visit events_path
#      save_and_open_page
      page.should have_content("Cool event ever")
      page.should have_content("Come and see")
#      page.should have_content("Cycle")

    end
  
  describe "POST /events" do

    it "Create an event" do
      visit events_path
      click_link "New Event"
      save_and_open_page
      user_login("admin@example.com", "admin123")
      fill_in "event_title", :with  => "Conference"
      fill_in "event_description", :with  => "Conference about"
      select '2013', :from => "event_date_1i" 
      select 'May', :from => "event_date_2i" 
      select '21', :from => "event_date_3i" 
      save_and_open_page
      click_button "Create Event"
      page.should have_content("Event was successfully created.")
#      save_and_open_page
    end

    
    pending it "Associate a cycle to an event" do

    end

    it "Update an event" do
      visit "/events/1"
      click_link "Edit"
      user_login("admin@example.com", "admin123")
      fill_in "event_title", :with  => "Show"
      fill_in "event_description", :with  => "A coooool show"
      select '2013', :from => "event_date_1i" 
      select 'January', :from => "event_date_2i" 
      select '2', :from => "event_date_3i" 
      click_button "Update Event"
      page.should have_content("Event was successfully updated.")

 #     save_and_open_page

    end

  end



end
