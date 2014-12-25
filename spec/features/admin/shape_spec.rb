require 'spec_helper'

feature 'shapes' do
  feature 'creating a new shape' do
    given!(:admin) { create :user_admin }

    before(:each) do
      login_as admin
      visit admin_shapes_path
    end

    scenario "proper params are filled" do
      click_on "New Shape"
      fill_in 'Title', with: "Crane"
      fill_in 'Tutorial url', with: 'http://www.youtube.com/tutorial-crane'
      click_on 'Save'
      expect(page).to have_content "Shape was successfully created."
    end

    scenario "at least a necessary param is not provided" do
      click_on "New Shape"
      click_on 'Save'
      expect(page).to have_content "Title can't be blank"
    end

    feature "field already taken" do
      given!(:shape) { create :shape, title: "Ninja Crane"}

      scenario "error is prompt" do
        click_on "New Shape"
        fill_in 'Title', with: "Ninja Crane"
        click_on 'Save'
        expect(page).to have_content "Title has already been taken"
      end
    end
  end
end
