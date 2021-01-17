class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :goods_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  #商品名のバリデーション
  validates :goods, presence: true
  #商品の説明のバリデーション
  validates :info, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :goods_status_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 

  #価格のバリデーション
  validates :price, presence: true
   validates :price, :numericality => { :greater_than_or_equal_to => 300 }  # 数字が300以上であるか
   validates :price, :numericality => { :less_than => 10000000 } # 数字が9999999以下か？

  #with_options presence: true, format: { with: /[299-999999]|1[0-7]/, message: 'Price Out of setting range' } do
   # validates :price
end