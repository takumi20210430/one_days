require 'rails_helper'

RSpec.describe ArticleComment, type: :model do
   describe 'バリデーションのテスト' do
    subject { article_comment.valid? }

    let(:user) { create(:user) }
    let!(:article) { build(:article, user_id: user.id) }
    let!(:article_comment) { build(:article_comment, article_id: article.id) }

    context 'commentカラム' do
      it '空欄でないこと' do
        article_comment.comment = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇' do
        article_comment.comment = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        article_comment.comment = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
end
