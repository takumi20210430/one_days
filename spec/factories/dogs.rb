FactoryBot.define do
  factory :dog do
    name { Faker::Lorem.characters(number: 15) }
    skill { Faker::Lorem.characters(number: 15) }
    favorite { Faker::Lorem.characters(number: 15) }
    introduction { Faker::Lorem.characters(number: 150) }
  end
end
