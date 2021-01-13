# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
<!-- | email              | string | null: false | -->
| email              | string | unique: true |
<!-- | password           | string | null: false | -->
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
<!-- | image         | string     | null: false | -->
| goods            | string     | null: false |
| category_id      | string     | null: false |
| info             | text       | null: false |
| goods_status_id  | string     | null: false |
| delivery_fee_id  | integer    | null: false |
| prefecture_id    | string     | null: false |
| delivery_days_id | string     | null: false |
| price            | integer    | null: false |

### Association

- has_one    :purchases
<!-- - belongs_to :users -->
- belongs_to :user

## purchases テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
<!-- | users      | references | null: false, foreign_key: true | -->
<!-- | items      | references | null: false, foreign_key: true | -->

### Association

<!-- - belongs_to :users -->
- belongs_to :user
<!-- - belongs_to :items -->
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
<!-- | purchases    | references | null: false, foreign_key: true | -->
| purchase      | references | null: false, foreign_key: true |

<!-- - belongs_to :purchases -->
- belongs_to :purchase