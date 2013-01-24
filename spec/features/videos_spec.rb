require 'spec_helper'

  describe "GET /videos" do
  
  before do
    create_sample_cycles
    create_sample_users
    create_sample_videos({:title => "Video number 1",:description => "Description video number 1"})
    50.times do
      create_sample_videos 
    end   
  end
    
    it "display videos index" do
      visit videos_path
      page.should have_content("Video number 1")
    end
    
  describe "POST /videos" do
    it "Create a video" do
      user_login("admin@example.com", "admin123")
      visit videos_path
      click_link "New Video"

      fill_in "video_title", :with  => "Video handmande"
      fill_in "video_description", :with  => "Video handmade"
      
#      save_and_open_page
      click_button "Create Video"
      page.should have_content("Video was successfully created.")
#     save_and_open_page
    end
    pending it "Associate a video to an event" do

    end

    it "Update a video" do
      user_login("admin@example.com", "admin123")
      visit videos_path
      page.all(".name")[1].first("a").click 

      click_link "Edit"
      fill_in "video_title", :with  => "Modify"
      fill_in "video_description", :with  => "Modified description"
     
      click_button "Update Video" 
      page.should have_content("Video was successfully updated.")
#     save_and_open_page
    end 
  end


end
