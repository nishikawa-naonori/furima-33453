# フォームオブジェクト
class PurchaseAddress
  include ActiveModel::Model

  # attr_accessor  保存するカラムをコントローラーから持ってくる
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city,
                :banchi, :building, :phone_number, :token


  # バリデーション
  # 郵便番号
    validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, }
  # 都道府県
    validates :prefecture_id, numericality: { other_than: 1 }
  # 電話番号
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, }
  # 市区町村
    validates :city, presence: true
  # 番地
    validates :banchi, presence: true
  # ユーザー情報
    validates :user_id, presence: true 
  # 商品情報
    validates :item_id, presence: true
  # クレジットカード情報のトークン
    validates :token, presence: true



  def save
    # 各テーブルにデータを保存する処理を書く
    # 購入テーブルに保存
    #binding.pry
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code:  postal_code,  prefecture_id:  prefecture_id,  city:        city,        banchi: banchi,
                   phone_number: phone_number, building:       building,       purchase_id: purchase.id)
  end
end