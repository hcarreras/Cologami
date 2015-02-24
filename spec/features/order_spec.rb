require 'spec_helper'

feature 'order' do
  feature 'proceed to checkout' do
    given!(:cart_with_design) { create :cart_with_design}
    scenario "requires an user account" do
      visit cart_url(cart_with_design)
      click_on "Proceder al pago"
      expect(page).to have_content "Create an account"
      expect(page).to have_content "Login"
    end
  end
end