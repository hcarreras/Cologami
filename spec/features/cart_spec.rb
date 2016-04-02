require 'spec_helper'

feature 'cart' do
  feature "adding to cart" do
    given!(:user) { create :user}
    given!(:shape){ create :shape, title: "Crane"}
    given!(:design){ create :design, :with_image, shape: shape}

    scenario "can add to cart without user" do
      visit root_url
      click_on("Añadir al carrito")
      login user
      expect(page).to have_content("Crane")
      expect(page).to have_content("Dirección de envío")
    end

    scenario "can add to cart when user is logged in" do
      login_as user
      visit root_url
      click_on("Añadir al carrito")
      expect(page).to have_content("Crane")
      expect(page).to have_content("Dirección de envío")
    end
  end
end