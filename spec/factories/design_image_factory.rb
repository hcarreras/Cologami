FactoryGirl.define do
  factory :design_image, class: "Design::Image" do
    file { File.open(File.join(Rails.root,'spec','support','images',"ninja_crane.jpg"))}
  end
end
