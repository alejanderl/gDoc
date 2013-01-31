# -*- coding: utf-8 -*-
require 'spec_helper'
  
  describe "Change language" do
     it "Check that laguage is set to English" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      I18n.default_locale = :en
       #page.all(".name")[1].first("a").click
      page.all("header").should_not have_content("ciclos")
    end
    it "from English to Spanish" do
      visit "/"
      click_link("español")
      page.should have_content("ciclos")

    end

    it "Checking routes are also translated" do
      visit "/"
      page.should have_content("cycles")
      click_link("español")
      current_path.should == "/es/ciclos"

    end
    
  end
