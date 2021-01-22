class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      ## 郵便番号
      t.string :postal_code,            null: false
      ## 都道府県(配送先) 
      t.integer :prefecture_id,         null: false
      ## 市区町村 
      t.string :city,                   null: false
      ## 番地
      t.string :banchi,                 null: false
      ## 建物名
      t.string :building,               null: false
      ## 電話番号
      t.string :phone_number,           null: false
      ## 購入テーブルとのアソシエーション
      t.references :purchase, foreign_key: true
      ## デフォルトのタイムスタンプ
      t.timestamps
    end
  end
end
