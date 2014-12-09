require 'spec_helper'

feature 'designs' do
  before(:each) { visit designs_path}

  scenario "proper params are filled" do
    click_on "New"
    fill_in 'Title', with: "Ninja Crane"
    fill_in 'Price', with: 2.99
    fill_in 'Description', with: 'This crane will spy your kids while they play with it.'
    fill_in 'Tutorial url', with: 'http://www.example.es/how-to-fold-your-ninja-crane'
    click_on 'Create Design'
    expect(page).to have_content "Design was successfully created."
  end

  scenario "at least a necessary param is not provided" do
    click_on "New"
    fill_in 'Title', with: "Ninja Crane"
    click_on 'Create Design'
    expect(page).to have_content "Price can't be blank"
  end
end
