FactoryGirl.define do
  factory :line_item do
    quantity 1
    association :shape
    association :cart
  end
end
