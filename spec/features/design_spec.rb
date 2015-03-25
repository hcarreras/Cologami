require 'spec_helper'

feature 'design' do
  feature "only can see private content if user bought design" do
    given!(:design) { create :design}
    given!(:admin) { create :user_admin }

    scenario "user does not have access" do
      visit design_url(design)
      expect(page).to have_no_link ("Download Sheet")
      expect(page).to have_button("2,98 € Add to cart")
    end

    scenario "when user bought the design" do
      #Need to create a design with sheet
      skip
    end
  end
end
