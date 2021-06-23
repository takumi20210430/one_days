FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 30) }
    body { Faker::Lorem.characters(number: 1000) }
  end
end
