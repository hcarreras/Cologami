module SpecHelpers
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

RSpec.configure do |config|
  config.include(SpecHelpers, type: :feature)
end
