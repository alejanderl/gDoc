require 'spec_helper'

  describe "GET /events" do

  before do
    user = FactoryGirl.create(:user)  
    visit new_user_session_path  
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => "secret"
    click_button "Sign in"
    FactoryGirl.create_list(:event,8)
  end
    
   after(:each) do
       FactoryGirl.factories.clear
       FactoryGirl.reload
    end


    it "display events index" do
      visit events_path
      page.should have_content("Event 1")
      page.should have_content("Date")
      page.should have_content("Time")
      page.should have_content("Description")
      page.should have_content("Cycle")
      save_and_open_page
    end
  
  describe "POST /events" do

    before(:each) do
       @user = FactoryGirl.create(:user)
      login_as @user, :scope => :user
   end


    it "Create an event" do
      visit events_path
      click_link "New Event"
      save_and_open_page
      fill_in "event_title", :with  => "Conference"
      fill_in "event_description", :with  => "Conference about"
      select '2013', :from => "event_date_1i" 
      select 'May', :from => "event_date_2i" 
      select '21', :from => "event_date_3i" 
      select 'Cycle 2', :from => "event_cycle_id"
      click_button "Create Event"
      page.should have_content("Event was successfully created.")
<<<<<<< HEAD
=======

>>>>>>> 7a7cf915ce84d010cae8e6137bd6d149d2634da2

#      save_and_open_page
    end
    
    it "Update an event" do
  #    FactoryGirl.create_list(:cycle, 3) 
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
<<<<<<< HEAD

=======
 #     save_and_open_page
>>>>>>> 7a7cf915ce84d010cae8e6137bd6d149d2634da2
    end

  end



end
