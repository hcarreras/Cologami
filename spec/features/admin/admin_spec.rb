require 'spec_helper'

feature 'admin' do
  given!(:user) { create :user}
  given!(:admin) { create :user_admin}
  given!(:design) { create :design, :with_image}

  scenario "redirects to root if user is not admin" do
    login_as user
    visit admin_path
    expect(page).to have_no_content("Admin")
  end

  scenario "shows the admin zone if the user is an admin" do
    login_as admin
    visit admin_path
    expect(page).to have_content("Designs")
  end
end