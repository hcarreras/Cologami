FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "password"

    factory :user_admin do
      email "admin@example.com"
      password "password"
      password_confirmation "password"
      admin true
    end
  end
end
