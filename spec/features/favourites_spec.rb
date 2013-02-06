require 'spec_helper'

  describe "Add a favourite" do
  before do
    create_sample_cycles
    create_sample_photos
    create_sample_users
 end


     it "Non registered user cannot add favourites" do
        visit "/photos/1"
        page.should_not have_button("add to favourites")

    end

    pending  it "Registerd user adds a favourites", :js => true do
        user_login("admin@example.com", "admin123")
        visit "/photos/1"
        page.should have_button("add to favourites")
        click_button ("add to favourites")
#        current_path.should == "/photos/1"
#        save_and_open_page
        page.should have_button("remove from favourites")

    end

  end

