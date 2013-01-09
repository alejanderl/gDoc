require 'spec_helper'

  describe "GET /events" do
  
  before do
    user = FactoryGirl.create(:user)  
    visit new_user_session_path  
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => "secret"
    click_button "Sign in"
  end
    
    it "display events index" do
      FactoryGirl.create(:event)
      visit events_path
      page.should have_content("Event 1")
      page.should have_content("Description")
      page.should have_content("Cycle")
#      save_and_open_page
    end
  describe "POST /events" do
    it "Create an event" do
      FactoryGirl.create(:event)
      visit events_path
      click_link "New Event"
      fill_in "event_title", :with  => "Conference"
      fill_in "event_description", :with  => "Conference about"
      select '2013', :from => "event_date_1i" 
      select 'May', :from => "event_date_2i" 
      select '21', :from => "event_date_3i" 
      click_button "Create Event"
      page.should have_content("Event was successfully created.")
#      save_and_open_page
    end
    it "Update an event" do
      FactoryGirl.create(:event)
      visit "/events/1"
      click_link "Edit"
      fill_in "event_title", :with  => "Show"
      fill_in "event_description", :with  => "A coooool show"
      select '2013', :from => "event_date_1i" 
      select 'January', :from => "event_date_2i" 
      select '2', :from => "event_date_3i" 
      click_button "Update Event"
      page.should have_content("Event was successfully updated.")
      #save_and_open_page
    end

  end



end
