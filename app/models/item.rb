class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :goods_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image
    # 商品名のバリデーション
    validates :goods
    # 商品の説明のバリデーション
    validates :info
    # 価格のバリデーション
    validates :price
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :goods_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  # 価格のバリデーション
  validates :price, numericality: { greater_than_or_equal_to: 300 } # 数字が300以上であるか
  validates :price, numericality: { less_than: 10_000_000 } # 数字が9999999以下か？

  with_options presence: true, format: { with: /\A[0-9]+\z/} do
    validates :price
  end
end
