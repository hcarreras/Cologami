require 'spec_helper'

feature 'designs' do
  feature 'creating a new design' do
    given!(:admin) { create :user_admin }
    given!(:shape) {create :shape}

    before(:each) do
      login_as admin
      visit admin_shapes_path
    end

    scenario "proper params are filled" do
      click_on "New Design"
      fill_in 'Title', with: "Ninja Crane"
      fill_in 'Price', with: 2.99
      fill_in 'Description', with: 'This crane will spy your kids while they play with it.'
      click_on 'Save'
      expect(page).to have_content "Design was successfully created."
    end

    scenario "at least a necessary param is not provided" do
      click_on "New Design"
      fill_in 'Title', with: "Ninja Crane"
      click_on 'Save'
      expect(page).to have_content "Price can't be blank"
    end

    feature "with one images" do
      scenario "both images are properly created" do
        click_on "New Design"
        fill_in 'Title', with: "Ninja Crane"
        fill_in 'Price', with: 2.99
        attach_file 'images[file][]', File.join(Rails.root,'spec/support/images/ninja_crane.jpg')
        click_on "Save"
        skip("Need to implement the index first")
        within '#design_images' do
          expect(page).to have_image "ninja_crane.jpg"
        end
      end
    end
  end

  feature 'editing designs' do
    given!(:shape_with_design){ create(:shape_with_design)}
    given!(:admin) { create :user_admin }

    before(:each) do
      login_as admin
      visit admin_shapes_path
    end

    scenario "from the designs index" do
      click_on "Edit"
      fill_in 'Title', with: "Hilarious hippopotamus"
      click_on "Save"
      expect(page).to have_content "Design was successfully updated."
      expect(page).to have_content "Hilarious hippopotamus"
    end
  end
end
