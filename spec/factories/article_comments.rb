FactoryBot.define do
  factory :article_comment do
    user    { create(:user) }
    association :article

    comment { Faker::Lorem.characters(number: 200) }
  end
end
