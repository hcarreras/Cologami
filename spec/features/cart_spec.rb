require 'spec_helper'

feature 'cart' do
  feature "adding to cart" do
    given!(:user) { create :user}
    given!(:design){ create :design, title: "Samurai", price: 2.98}
    given!(:second_design){ create :design, title: "princess crane", price: 3.15, shape: design.shape}

    scenario "can add to cart without user" do
      visit design_path(design)
      click_on("2,98 € Añadir al carrito")
      expect(page).to have_content("Diseño añadido al carrito")
    end

    scenario "can add to cart when user is logged in" do
      login_as user
      visit design_path(design)
      click_on("2,98 € Añadir al carrito")
      expect(page).to have_content("Diseño añadido al carrito")
    end

    scenario "cannot add to cart twice the same design" do
      visit design_path(design)
      click_on("2,98 € Añadir al carrito")
      expect(page).to have_content("Diseño añadido al carrito")
      visit design_path(design)
      click_on("2,98 € Añadir al carrito")
      expect(page).to have_content("El diseño ya está en el carrito")
    end

    scenario "can add multiple designs to the cart" do
      visit design_path(design)
      click_on("2,98 € Añadir al carrito")
      expect(page).to have_content("Diseño añadido al carrito")
      visit design_path(second_design)
      click_on("3,15 € Añadir al carrito")
      expect(page).to have_content("Diseño añadido al carrito")
    end

    scenario "it redirects to the cart show page" do
      visit design_path(design)
      click_on("2,98 € Añadir al carrito")
      expect(page).to have_content("Seguir Comprando")
      expect(page).to have_content("Proceder al pago")
    end
  end

  feature "managing the cart" do
    given!(:user) { create :user}
    given!(:design){ create :design, title: "Samurai", price: 2.98}

    background do
      visit design_path(design)
      click_on("2,98 € Añadir al carrito")
    end

    scenario "can delete line item" do
        visit_current_cart
        click_on("delete-1")
        puts I18n.locale
        puts I18n.default_locale
        expect(page).to have_content("El diseño se ha eliminado del carrito")
    end
  end
end