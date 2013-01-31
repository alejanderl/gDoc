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
      user_login("admin@example.com", "admin123")
      visit events_path
      save_and_open_page
      click_link "New Event"
      save_and_open_page
      fill_in "event_title", :with  => "Conference"
      fill_in "event_description", :with  => "Conference about"
      click_button "Create Event"
      page.should have_content("Event was successfully created.")

    end

    
    pending it "Associate a cycle to an event" do

    end

    it "Update an event", :js => true do
      visit events_path
      user_login("admin@example.com", "admin123")
      visit "/events/1"      
      click_link "Edit"
      fill_in "event_title", :with  => "Show"
      fill_in "event_description", :with  => "A coooool show"

 
      page.execute_script("$('.hasDatepicker').trigger('focus')") # activate datetime picker
      page.execute_script "$('a.ui-datepicker-next').trigger('click') " # move one month forward
      page.execute_script %q{$('a.ui-state-default:contains("15")').trigger('click')}#click on day 15
      
      page.execute_script("$('.time-picker').trigger('focus')") # activate datetime picker
#      find('.ui_tpicker_hour button.ui-icon-plus').native.drag_by(30, 0)
      10.times do
        page.execute_script %q{$('.ui_tpicker_hour button.ui-corner-right').trigger('click')}
        page.execute_script %q{$('.ui_tpicker_minute button.ui-corner-right').trigger('click')}
      end
      click_button "Update Event" 
      
      page.should have_content("Event was successfully updated.")

    end

  end



end
