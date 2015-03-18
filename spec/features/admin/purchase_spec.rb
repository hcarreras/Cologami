require 'spec_helper'

feature 'purchases' do
  feature 'shows the purchases' do
    given!(:admin) { create :user_admin }
    given!(:purchase) {create :purchase}

    before(:each) do
      login_as admin
      visit admin_purchases_path
    end

    scenario "sees its purchase" do
      expect(page).to have_text("Purchases")
      expect(page).to have_text("user@example.com")
    end
  end
end
