FactoryGirl.define do
  factory :design, class: "Design" do
    title "Natsuki"
    association :shape
    trait :with_image do
      after(:create) do |design, _|
        create_list(:design_image, 1, design: design)
      end
    end
  end

  factory :second_design, class: "Design" do
    title "princess Crane"
    description "This pink crane is simply beautiful"
    after(:create) do |design, _|
      create_list(:design_image, 3, design: design)
    end
    association :shape
  end
end
