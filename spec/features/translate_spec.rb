require 'spec_helper'
  
  describe "Change language" do
    
     it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      I18n.default_locale = :en
      
      #page.all(".name")[1].first("a").click
      page.all("header").should_not have_content("ciclos")
    end
    
  end
