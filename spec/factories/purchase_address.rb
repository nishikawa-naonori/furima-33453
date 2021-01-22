FactoryBot.define do
  factory :purchase_address do
    # フォームオブジェクトはアソシエーションできない
    token                  { 'test1234' }
    postal_code            { '270-0035' }
    prefecture_id          { 2 }
    city                   { '第三新東京市' }
    banchi                 { '15番地' }
    phone_number           { '09034053913' }
    building               { 'マウスビル' }
    user_id                { 2 }
    item_id                { 2 }
  end
end
