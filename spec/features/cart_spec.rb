require 'spec_helper'

feature 'cart' do
  feature "adding to cart" do
    given!(:user) { create :user}
    given!(:design){ create :design, price: 2.98}
    given!(:second_design){ create :design, title: "princess crane", price: 3.15, shape: design.shape}

    scenario "can add to cart without user" do
      visit design_path(design)
      click_on("$2.98 Add to cart")
      expect(page).to have_content("Design added to the cart")
    end

    scenario "can add to cart when user is logged in" do
      login_as user
      visit design_path(design)
      click_on("$2.98 Add to cart")
      expect(page).to have_content("Design added to the cart")
    end

    scenario "cannot add to cart twice the same design" do
      visit design_path(design)
      click_on("$2.98 Add to cart")
      expect(page).to have_content("Design added to the cart")
      visit design_path(design)
      click_on("$2.98 Add to cart")
      expect(page).to have_content("Design already in cart")
    end

    scenario "can add multiple designs to the cart" do
      visit design_path(design)
      click_on("$2.98 Add to cart")
      expect(page).to have_content("Design added to the cart")
      visit design_path(second_design)
      click_on("$3.15 Add to cart")
      expect(page).to have_content("Design added to the cart")
    end

    scenario "it redirects to the cart show page" do
      visit design_path(design)
      click_on("$2.98 Add to cart")
      expect(page).to have_content("Seguir Comprando")
      expect(page).to have_content("Proceder al pago")
    end
  end

  feature "controlling the cart" do
    given!(:user) { create :user}
    given!(:cart_with_design) { create :cart_with_design}

    scenario "can delete line item" do
        visit cart_url(cart_with_design)
        click_on("delete-1")
        expect(page).to have_content("Line item was successfully destroyed")
    end
  end
end