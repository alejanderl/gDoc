require 'spec_helper'

  describe "GET /videos" do
  
  before do
    create_sample_cycles
    create_sample_users
    create_sample_videos({:title => "Video number 1",:description => "Description video number 1"})
    50.times do
      create_sample_videos
      create_sample_cycles
      create_sample_photos
      create_sample_documents
      create_sample_audios
      create_sample_participants
      
    end
  
  end
  
  it "check the pagination exist" do
    visit videos_path
    page.should have_selector("nav.pagination")
  end
  
end