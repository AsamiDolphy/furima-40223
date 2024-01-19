# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| birth_date         | date   | null: false               |

### Association

has_many :items
has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | integer    | null: false                    |
| sales_status        | integer    | null: false                    |
| shipping_fee_status | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| scheduled_delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

## Association

belongs_to :user_id
has_one :order

## orders テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| item_id |references | null: false, foreign_key: true |
| user_id |references | null: false, foreign_key: true |

## Association

belongs_to :item_id
belongs_to :user_id

## shipping-addresses テーブル

| Column       | Type       | Options                  |
| ------------ | ---------- | ------------------------ |
| postal-code  | string     | null: false              |
| prefecture   | integer    | null: false              |
| city         | string     | null: false              |
| addresses    | string     |                          |
| building     | string     | null: false              |
| phone-number | string     | null: false              |
| item_id      | references | null: false, foreign_key |
| user_id      | references | null: false, foreign_key |

## Association

belongs_to :order_id
belongs_to :user_id