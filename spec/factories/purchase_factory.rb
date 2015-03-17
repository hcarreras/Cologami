FactoryGirl.define do
  factory :purchase do
    association :cart, factory: :cart_with_design
    association :user
  end
end
