# README

## usersテーブル
|  Column           |Type   |Options                   |
|-------------------|-------|--------------------------|
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |

has_many :order_users
has_many :orders, through: :order_users

## ordersテーブル
| Column         |Type   |Options     |
|----------------|-------|------------|
|group           |string |null: false |
|content_name    |string |            |
|event_name      |string |            |
|price           |string |            |
|memo            |text   |            |
|event_day       |date   |            |
|date_of_payment |date   |            |


has_many :order_users
has_many :users, through: :order_users

## order_usersテーブル
| Column | Type      |Options                        |
|--------|-----------|-------------------------------|
|user    |references |null: false, foreign_key: true |
|order   |references |null: false, foreign_key: true |

belongs_to :user
belongs_to :order