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


# アプリケーション名 
original-app-36951
# アプリケーション概要
サッカーチーム公式サイト
チーム情報を確認できたり、チームの商品の購入が可能
# URL
https://original-app-36951.herokuapp.com/
# Basic認証
ID: admin
pass: 2222
# ログインID & PASS
ID: 制作中
pass: 制作中
admin ID: 制作中
admin PASS: 制作中
# 利用方法
ファンなどのユーザーが商品を購入したり、チームのNEWSや選手情報を確認する
# 目指した課題解決
ファンなどのユーザーがチーム情報(日程や、スコアなど)を知りたいときに知れる。
チームの商品を購入したいときに購入できる。
# 洗い出した要件
| トップページの作成     |
| 選手の詳細ページの実装 |
| 商品ページ	          |
| 購入ページの実装	    |
| ログインページの作成	  | 
| デプロイ	           |
| 商品ページの実装	    |
| NEWS詳細ページの作成	|
| S3の導入		         |
| ユーザー管理機能の実装	 |
| Basic認証の導入	     |
# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
NEWSの詳細ページ
S3の導入
選手の詳細ページ
# データベース設計

# ローカルでの動作方法
% git clone https://github.com/kazuhiro-tsuchiya/original-app-36951
% cd original-app-36951
% bundle install
% yarn install
% rails db:create
% rails db:migrate
% rails s
