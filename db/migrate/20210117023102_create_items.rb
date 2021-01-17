class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      ## 商品名
      t.string :goods,              null: false, default: ""
      ## 商品の説明 
      t.text :info
      ## カテゴリー 
      t.integer :category_id
      ## 商品の状態
      t.integer :goods_status_id
      ## 配送料の負担
      t.integer :delivery_fee_id
      ## 発送元の地域
      t.integer :prefecture_id
      ## 発送までの日数
      t.integer :delivery_day_id
      ## 価格
      t.integer :price
      ## ユーザー管理テーブルとのアソシエーション
      t.integer :user_id

      ## デフォルトのタイムスタンプ
      t.timestamps
    end
  end
end