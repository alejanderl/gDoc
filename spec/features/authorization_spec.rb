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
    
    visit "/en/audios/2/edit"
    page.should have_content("Not authorized")

  end
  
end