module SpecHelpers
  def visit_current_cart
    visit root_url
    find("a.cart").click()
  end
end

RSpec.configure do |config|
  config.include(SpecHelpers, type: :feature)
end
