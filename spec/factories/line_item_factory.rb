FactoryGirl.define do
  factory :line_item do
    quantity 1
    association :design
    association :cart
  end
end
