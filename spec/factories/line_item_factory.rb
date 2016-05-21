FactoryGirl.define do
  factory :line_item do
    quantity "10"
    association :shape
    association :cart
  end
end
