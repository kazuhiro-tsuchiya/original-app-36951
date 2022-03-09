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
- has_many :items


## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| quantity_id   | integer    | null: false                    |
| size_id       | integer    |                                |
| item          | references | null: false, foreign_key: true | 
| user          | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item
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