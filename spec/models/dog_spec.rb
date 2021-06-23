require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe 'バリデーションのテスト' do
    subject { dog.valid? }

    let(:user) { create(:user) }
    let!(:dog) { build(:dog, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        dog.name = ''
        is_expected.to eq false
      end
      it '15文字以下であること: 15文字は〇' do
        dog.name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること: 16文字は×' do
        dog.name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end

    context 'skillカラム' do
      it '15文字以下であること: 15文字は〇' do
        dog.skill = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること: 16文字は×' do
        dog.skill = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end

    context 'favoriteカラム' do
      it '15文字以下であること: 15文字は〇' do
        dog.favorite = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること: 16文字は×' do
        dog.favorite = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '150文字以下であること: 150文字は〇' do
        dog.introduction = Faker::Lorem.characters(number: 150)
        is_expected.to eq true
      end
      it '150文字以下であること: 151文字は×' do
        dog.introduction = Faker::Lorem.characters(number: 151)
        is_expected.to eq false
      end
    end
  end

end
