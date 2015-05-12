module SpecHelpers
  def visit_current_cart
    visit root_url
    find("a.cart").click()
  end

  def expect_to_be_in_home
    expect(current_path).to be_eql("/")
  end
end

RSpec.configure do |config|
  config.include(SpecHelpers, type: :feature)
end
