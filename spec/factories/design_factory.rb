FactoryGirl.define do
  factory :design, class: "Design" do
    title "Ninja Crane"
    price 2.98
    description "The traditional crane and the traditional ninja mixed together could just have this amazing result."
    after(:create) do |design, _|
      create_list(:design_image, 1, design: design)
    end
    association :shape
  end

  factory :second_design, class: "Design" do
    title "princess Crane"
    price 3.15
    description "This pink crane is simply beautiful"
    after(:create) do |design, _|
      create_list(:design_image, 3, design: design)
    end
    association :shape
  end
end
