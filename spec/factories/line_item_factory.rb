FactoryGirl.define do
  factory :line_item do
    association :design
    association :cart
  end
end
