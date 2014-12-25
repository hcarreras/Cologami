FactoryGirl.define do
  factory :shape do
    title "Crane"
    tutorial_url "http://www.youtube.com/ninja_crane_tutorial"
    factory :shape_with_design do
      after(:create) do |shape, _|
        create_list(:design, 1, shape: shape)
      end
    end
  end
end
