FactoryBot.define do
  factory :article_comment do
    comment { Faker::Lorem.characters(number: 200) }
  end
end
