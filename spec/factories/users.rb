FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 10) }
    email                 { Faker::Internet.free_email }
    password              { '19901aA' }
    password_confirmation { password }
    name1                 { 'テスト試験いち' }
    name2                 { 'テスト試験に' }
    name_kana1            { 'テストイチ' }
    name_kana2            { 'テストニ' }
    birth_date            { '1990-11-09' }
  end
end
