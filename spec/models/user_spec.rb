require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全て正常の場合" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@なしでは登録できない" do
        @user.email = "11"
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "0000a"
        @user.password_confirmation = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = "aaaaaA"
        @user.password_confirmation = "aaaaaA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字が存在しないと登録できない" do
        @user.name1 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name1 can't be blank")
      end
      it "名字が全角の漢字orカタカナorひらがなでないと登録できない" do
        @user.name1 = "a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name1 全角文字を使用してください")
      end
      it "名前が存在しないと登録できない" do
        @user.name2 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name2 can't be blank")
      end
      it "名字(カナ)が存在しないと登録できない" do
        @user.name_kana1 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana1 can't be blank")
      end
      it "名前(カナ)が存在しないと登録できない" do
        @user.name_kana2 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana2 can't be blank")
      end
      it "生年月日が存在しないと登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end