FactoryGirl.define do
  factory :design, class: "Design" do
    title "Ninja Crane"
    price 2.98
    description "The traditional crane and the traditional ninja mixed together could just have this amazing result."
    tutorial_url "http://www.youtube.com/ninja_crane_tutorial"
    after(:create) do |design, _|
      create_list(:design_image, 1, design: design)
    end
  end
end
