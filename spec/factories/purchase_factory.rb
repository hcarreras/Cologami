FactoryGirl.define do
  factory :purchase do
    association :cart_with_design
    association :user
  end
end
