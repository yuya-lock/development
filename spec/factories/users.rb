FactoryBot.define do
  factory :user, aliases: [:author] do
    name { "Bob" }
    sequence(:mail) { |n| "tester#{n}@example.com" }
    password { "example" }
    password_confirmation { "example" }
  end
end
