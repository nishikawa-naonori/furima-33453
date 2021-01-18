require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能テスト' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品がうまくいくとき' do
      it '全て正常の場合' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it '写真がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.goods = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods can't be blank")
      end
      it '商品説明がないと登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーを選択しないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態を選択しないと登録できない' do
        @item.goods_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Goods status must be other than 1')
      end
      it '配送料の負担を選択しないと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域を選択していないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数を選択をしていないと登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it '販売価格を記述していないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が1000000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '値段が全角数字の場合は登録できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
