require 'acceptance/acceptance_helper'

feature "Cycles", %q{
  We are going to have cycles that may group events
} do

  background do
    Cycle.create!(:title => 'Geek-art')
    Cycle.create!(:title => 'Gastronomy')
  end

  scenario "Cycles index" do
    visit '/cycles'
    page.should have_content('Geek-art')
    page.should have_content('Gastronomy')
  end

end