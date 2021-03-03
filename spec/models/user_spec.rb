require 'rails_helper'

RSpec.describe User, type: :model do
  
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "nicknameとemail、passwordとpassword_confirmationの存在があれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailはaaaでは登録できない' do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "ab3456"
        @user.password_confirmation = "ab34567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは英字のみの場合登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは数字のみの場合登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは6文字以下だと登録できない' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
