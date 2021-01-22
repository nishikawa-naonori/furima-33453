require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入テスト' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
    end

    context '商品購入がうまくいくとき' do
      it '全て正常値が入ってる場合' do
        # binding.pry
        expect(@purchase_address).to be_valid
      end
    end
    context '商品購入ができない時' do
      it 'クレジットカード情報がない及び、情報が誤っているとと購入不可' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がないと登録できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @purchase_address.postal_code = '2700035'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '市区町村を選択しないと登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地を記載しないと登録できない' do
        @purchase_address.banchi = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Banchi can't be blank")
      end
      it '電話番号を記載しないと登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が数字以外があると登録できない' do
        @purchase_address.phone_number = '0901234567a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が数字12桁以上だと登録できない' do
        @purchase_address.phone_number = '123456789112111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end

