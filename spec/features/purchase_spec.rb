require 'spec_helper'

feature 'purchase' do
  given!(:design) { create :design}
  feature 'proceed to checkout' do
    feature "requires an user" do
      before do
        visit design_url(design)
        click_on "Add to cart"
      end

      scenario "there is no user" do
        visit design_url(design)
        click_on "Add to cart"
        visit_current_cart
        click_on "Proceder al pago"
        expect(page).to have_content "Sign in"
        expect(page).to have_content "Registrate"
      end
    end
    feature "requires to have a cart with line items" do
      scenario "there are no items added to the cart" do
        visit_current_cart
        expect(page).to have_no_link "Proceder al pago"
      end
    end
    feature "allows user to pay" do
      given!(:design) { create :design}
      given!(:user) { create :user}

      before do
        login_as user
        visit design_url(design)
        click_on "Add to cart"
      end

      scenario "user pays correctly" do
        visit_current_cart
        click_on "Proceder al pago"
        click_on "Pagar ahora"
        expect(page).to have_content "Gracias por su compra, ya puede acceder al contenido que ha comprado"
      end
    end
  end
end