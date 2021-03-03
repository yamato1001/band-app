require 'rails_helper'

RSpec.describe Bandpost, type: :model do
  before do
    @bandpost = FactoryBot.build(:bandpost)
  end

  describe 'バンド投稿機能' do
    context 'バンド投稿できるとき' do
      it "必要事項が記入されていれば出品できる" do
        expect(@bandpost).to be_valid
      end
    end

    context 'バンド投稿できないとき' do
      it 'バンド画像が空では投稿できない' do
        @bandpost.image = nil
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("Image can't be blank")
      end
      it 'バンド映像が空では投稿できない' do
        @bandpost.video = nil
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("Video can't be blank")
      end
      it 'バンド名が空では投稿できない' do
        @bandpost.bandname = nil
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("Bandname can't be blank")
      end
      it 'バンド紹介文が空では投稿できない' do
        @bandpost.introduction = nil
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'ジャンルidが1では投稿できない' do
        @bandpost.genre_id = 1
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("Genre must be other than 1")
      end
      it '募集楽器idが1では投稿できない' do
        @bandpost.musical_instrument_id = 1
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("Musical instrument must be other than 1")
      end
      it '活動地域idが1では投稿できない' do
        @bandpost.area_id = 1
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("Area must be other than 1")
      end
      it '投稿したユーザーが紐付いていないと投稿できない' do
        @bandpost.user = nil
        @bandpost.valid?
        expect(@bandpost.errors.full_messages).to include("User must exist")
      end
    end
  end
end
