# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| name1           | string | null: false |
| name2           | string | null: false |
| name_kana1      | string | null: false |
| name-kana2      | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column        | Type       | Options     |
| ------        | ------     | ----------- |
| user          | referrence | null: false, foreign_key: true |
| image         | string     | null: false |
| goods         | string     | null: false |
| info          | text       | null: false |
| goods_status  | string     | null: false |
| delivery_fee  | integer    | null: false |
| prefecture    | string     | null: false |
| delivery_days | string     | null: false |
| price         | integer    | null: false |

### Association

- has_one    :purchases
- belongs_to :users

## purchases テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| items      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items


## addresses テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | string     | null: false                    |
| purchases    | references | null: false, foreign_key: true |

- belongs_to :purchases