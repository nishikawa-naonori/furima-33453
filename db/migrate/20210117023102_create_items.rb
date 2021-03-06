class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      ## 商品名
      t.string :goods,                  null: false
      ## 商品の説明 
      t.text :info,                     null: false
      ## カテゴリー 
      t.integer :category_id,           null: false
      ## 商品の状態
      t.integer :goods_status_id,       null: false
      ## 配送料の負担
      t.integer :delivery_fee_id,       null: false
      ## 発送元の地域
      t.integer :prefecture_id,         null: false
      ## 発送までの日数
      t.integer :delivery_day_id,       null: false
      ## 価格
      t.integer :price,                 null: false
      ## ユーザー管理テーブルとのアソシエーション
      t.references :user, foreign_key: true

      ## デフォルトのタイムスタンプ
      t.timestamps
    end
  end
end