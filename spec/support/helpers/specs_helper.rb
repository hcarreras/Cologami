module SpecHelpers
  def visit_current_cart
    visit root_url
    find(".current-cart").click()
  end
end

RSpec.configure do |config|
  config.include(SpecHelpers, type: :feature)
end
