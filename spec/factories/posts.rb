FactoryBot.define do
  factory :post do
    circle_name { "SesSion" }
    university { "早稲田大学" }
    body { "example,example,example"}
    association :author
  end
end
