FactoryBot.define do
  factory :drawing do
    association :user, factory: :user
    color_code "#000000"
    sequence :drawing_area do |n|
      "square_box_#{n}"
    end
  end
end
