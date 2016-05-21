FactoryGirl.define do
  factory :purchase do
    association :cart
    association :user
    customer_name "Frederik"
    address_street "Kystvej"
    address_zip 3050
    address_city "Humlebæk"
    address_country "Denmark"
    trait :paid do
      status "paid"
      price Money.new(5, "EUR")
      payment_data {}
      payment_id 0
      expire_month "11"
      expire_year "2022"
      last4 "4242"
      paid_at 1.week.ago
    end
  end
end
