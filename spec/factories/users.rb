FactoryBot.define do
  factory :user do
    sequence :ip_address do |n|
      "127.0.0#{n}"
    end
  end
end
