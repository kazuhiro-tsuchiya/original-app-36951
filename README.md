# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |

### Association
- has_many :purchases
- has_many :carts

## cartsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |

### Association
- has_many :item_carts
- belongs_to :user
- has_one :purchase

## cart_itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| quantity_id | integer    | null: false                    |
| size_id     | integer    |                                |
| item        | references | null: false, foreign_key: true |
| cart        | references | null: false, foreign_key: true |

### Association
- has_one :items
- belongs_to :cart

## itemsテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item_name   | string     | null: false |
| price       | integer    | null: false |
| quantity_id | integer    | null: false |
| size_id     | integer    |             |

| user     | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |

### Association
- belongs_to :cart_item

## purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true | 
| user          | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :cart
- has_one :address

## addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| area          | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true | 

### Association
- belongs_to :purchase