require 'spec_helper'

feature 'purchase' do
  given!(:design) { create :design, :with_image}
  feature 'proceed to checkout' do
    feature "requires to have a cart with line items" do
      scenario "there are no items added to the cart" do
        visit new_purchase_path
        expect(page).to have_no_content "Tu compra"
        expect(page).to have_no_content "Dirección de envío"
      end
    end
    feature "allows user to pay" do
      given!(:user) { create :user}

      before do
        login_as user
        visit root_url
        click_on I18n.t("index.buy.add_to_cart_button")
      end

      xscenario "user pays correctly" do
        fill_in "Nombre y Apellidos", with: "Emilio Balanegra"
        fill_in "Teléfono de Contacto", with: "666666666"
        fill_in "Línea 1 de dirección", with: "Fake street"
        fill_in "Línea 2 de dirección", with: "123"
        fill_in "Ciudad", with: "Fakeland"
        fill_in "Código ZIP", with: "1234"
        click_on "Pagar ahora"
        expect(page).to have content "Dame tu dinero"
      end
    end
  end
end