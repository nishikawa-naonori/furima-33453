# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | unique: true |
| encrypted_password | string | null: false |
| name1              | string | null: false |
| name2              | string | null: false |
| name_kana1         | string | null: false |
| name-kana2         | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| user             | referrence | null: false, foreign_key: true |
| goods            | string     | null: false |
| category_id      | integer    | null: false |
| info             | text       | null: false |
| goods_status_id  | integer    | null: false |
| delivery_fee_id  | integer    | null: false |
| prefecture_id    | integer    | null: false |
| delivery_days_id | integer    | null: false |
| price            | integer    | null: false |

### Association

- has_one    :purchase
- belongs_to :user

## purchases テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- has_one    :addresse
- belongs_to :user
- belongs_to :item


## addresses テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

- belongs_to :purchase