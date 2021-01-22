FactoryBot.define do
  factory :purchase_address do
    # フォームオブジェクトはアソシエーションできない
    token                  { 'test1234' }
    postal_code            { '270-0035' }
    prefecture_id          { 2 }
    city                   { 2 }
    banchi                 { 2 }
    phone_number           { '09034053913' }
    building               { 2 }
  end
end
