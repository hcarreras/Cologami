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

  feature 'account page' do
    context 'is not sign in' do
      before do
        visit static_url('account')
      end

      scenario 'it is redirected to the home page' do
        expect_to_be_in_home
      end
    end

    context 'user is sign in' do
      given!(:user) { create :user}

      before do
        login_as user
        visit static_url('account')
      end

      scenario 'shows user info' do
        expect(page).to have_content("¡Bienvenido user@example.com!")
      end

      scenario 'can log out' do
        click_on("Log out")
        expect(page).to have_content("Has cerrado sesión")
      end
    end
  end
end