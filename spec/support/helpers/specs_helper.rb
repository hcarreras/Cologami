module FeatureSpecHelpers
  def visit_current_cart
    visit root_url
    find("a.cart").click()
  end

  def expect_to_be_in_home
    expect(current_path).to be_eql("/")
  end

  def login user
    within "#sign_in" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      find('input[name="commit"]').click
    end
  end
end

module SpecHelpers
  def set_current_cart cart
    allow_any_instance_of(ApplicationController).to receive(:current_cart).and_return cart
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include(FeatureSpecHelpers, type: :feature)
  config.include(SpecHelpers)
end
