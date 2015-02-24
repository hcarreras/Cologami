FactoryGirl.define do
  factory :cart do
  end

  factory :cart_with_design, class: "Cart" do
    after(:create) do |cart, _|
      create_list(:line_item, 1, cart: cart)
    end
  end
end
