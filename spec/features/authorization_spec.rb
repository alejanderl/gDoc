require 'spec_helper'
  
describe "check users" do
  
  before do
    create_sample_users
    create_sample_audios
    @audio = Audio.last


  end
  
  it "anonymus users can't edit" do
   visit audios_path
   page.should_not have_content("New Audio")
   page.all(".name")[1].first("a").click
   page.should_not have_content("Edit")

  end
  
end