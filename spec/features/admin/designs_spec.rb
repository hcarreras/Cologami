require 'spec_helper'

feature 'designs' do
  before(:each) { visit admin_designs_path}
  feature 'creating a new design' do
    scenario "proper params are filled" do
      click_on "New"
      fill_in 'Title', with: "Ninja Crane"
      fill_in 'Price', with: 2.99
      fill_in 'Description', with: 'This crane will spy your kids while they play with it.'
      fill_in 'Tutorial url', with: 'http://www.example.es/how-to-fold-your-ninja-crane'
      click_on 'Save'
      expect(page).to have_content "Design was successfully created."
    end

    scenario "at least a necessary param is not provided" do
      click_on "New"
      fill_in 'Title', with: "Ninja Crane"
      click_on 'Save'
      expect(page).to have_content "Price can't be blank"
    end

    feature "with one images" do
      scenario "both images are properly created" do
        click_on "New"
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
    given!(:design){ create(:design)}
    before(:each) { visit admin_designs_path}

    scenario "from the designs index" do
      click_on "Edit"
      fill_in 'Title', with: "Hilarious hippopotamus"
      click_on "Save"
      expect(page).to have_content "Design was successfully updated."
    end
  end
end
