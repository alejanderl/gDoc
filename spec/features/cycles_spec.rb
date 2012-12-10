require 'spec_helper'

describe "Cycles" do
  describe "GET /cycles" do
    it "displays cycles" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      Cycle.create!(:title => "Geek-art")
      visit cycles_path
      page.should have_content("Geek-art")
    end
  end
  describe "POST /cycles" do
    it "create cycles" do
      visit cycles_path
      click_link "New Cycle"
#      fill_in "New Cycle", :with  => "Geek-art"
#      page.should have_content("Geek-art")
#      page.should have_content("Successfully added cycle")

    end
 end



end
