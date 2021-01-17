FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    goods                  {"テスト試験いち"}
    info                   {"テスト試験いち"}
    category_id            {2}
    goods_status_id           {2}
    delivery_fee_id           {2}
    prefecture_id             {2}
    delivery_day_id           {2}
    price                  {1000}
  end
end
