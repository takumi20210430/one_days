require 'rails_helper'

RSpec.describe Article, type: :model do
   describe 'バリデーションのテスト' do
    subject { article.valid? }

    let(:user) { create(:user) }
    let!(:article) { build(:article, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        article.title = ''
        is_expected.to eq false
      end
      it '30文字以下であること: 30文字は〇' do
        article.title = Faker::Lorem.characters(number: 30)
        is_expected.to eq true
      end
      it '30文字以下であること: 31文字は×' do
        article.title = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '1000文字以下であること: 1000文字は〇' do
        article.body = Faker::Lorem.characters(number: 1000)
        is_expected.to eq true
      end
      it '1000文字以下であること: 1001文字は×' do
        article.body = Faker::Lorem.characters(number: 1001)
        is_expected.to eq false
      end
    end
  end
end
