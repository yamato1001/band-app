require 'rails_helper'

RSpec.describe Solopost, type: :model do
  before do
    @solopost = FactoryBot.build(:solopost)
  end

  describe 'ソロ投稿機能' do
    context 'ソロ投稿できるとき' do
      it "必要事項が記入されていれば出品できる" do
        expect(@solopost).to be_valid
      end
    end

    context 'ソロ投稿できないとき' do
      it 'ソロ画像が空では投稿できない' do
        @solopost.image = nil
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("Image can't be blank")
      end
      it 'ソロ映像が空では投稿できない' do
        @solopost.video = nil
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("Video can't be blank")
      end
      it 'ニックネームが空では投稿できない' do
        @solopost.nickname = nil
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("Nickname can't be blank")
      end
      it '自己紹介文が空では投稿できない' do
        @solopost.introduction = nil
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'ジャンルidが1では投稿できない' do
        @solopost.genre_id = 1
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("Genre must be other than 1")
      end
      it '担当楽器idが1では投稿できない' do
        @solopost.musical_instrument_id = 1
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("Musical instrument must be other than 1")
      end
      it '活動地域idが1では投稿できない' do
        @solopost.area_id = 1
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("Area must be other than 1")
      end
      it '投稿したユーザーが紐付いていないと投稿できない' do
        @solopost.user = nil
        @solopost.valid?
        expect(@solopost.errors.full_messages).to include("User must exist")
      end
    end
  end
end
