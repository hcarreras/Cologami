FactoryGirl.define do
  factory :purchase do
    association :cart
    association :user
    customer_name "Frederik"
    address_street "Kystvej"
    address_zip 3050
    address_city "Humlebæk"
    address_country "Denmark"
  end
end
