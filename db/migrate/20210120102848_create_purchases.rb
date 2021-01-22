class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      ## ユーザー管理テーブルとのアソシエーション
      t.references :user, foreign_key: true
      ## 商品テーブルとのアソシエーション
      t.references :item, foreign_key: true
      ## デフォルトのタイムスタンプ
      t.timestamps

    end
  end
end
