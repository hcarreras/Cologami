require 'spec_helper'

feature 'user' do
  feature 'index page' do
    before do
      visit users_url
    end

    scenario 'has a login button' do
      within ".jumbotron" do
        click_link("Login")
      end
      expect(page).to have_button("Sign in")
      expect(page).to have_content("Password")
    end

    scenario 'has a new user button' do
      expect(page).to have_link("Create an account")
      click_link("Create an account")
      expect(page).to have_button("Sign up")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
    end
  end
end