require 'spec_helper'

feature 'admin' do
  given!(:user) { create :user}
  given!(:admin) { create :user_admin}

  scenario "redirects to root if user is not admin" do
    login_as user
    visit admin_designs_path
    expect(page).to have_no_content("Admin")
    expect(page).to have_content("Long live to Harigami")
  end

  scenario "shows the admin zone if the user is an admin" do
    login_as admin
    visit admin_designs_path
    expect(page).to have_content("Designs")
    expect(page).to have_no_content("Long live to Harigami")
  end
end