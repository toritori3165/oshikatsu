# README

# アプリケーション名
oshikatsu
# アプリケーション概要
推し活を円滑にできるよう支援するアプリ。スケジュールや金銭のやり取りなどをカレンダーベースで一目で確認できる。
# URL
https://oshikatsu.onrender.com
# テスト用アカウント	

__・__ Basic認証 ID: miura

__・__ Basic認証 Pass: 0120

__・__ メールアドレス: aaa@aaa

__・__ パスワード: aaaaaa
# 利用方法
__・__ トップページのヘッダーからユーザー新規登録を行う

__・__ 購入品追加ボタンから、新しく購入した商品か、チケットなどの公演名などを登録する

__・__ indexページの上部にある公演カレンダーのチェックボックスを押すと公演カレンダーと商品用カレンダーが切り替えられる

__・__ indexページの上部からグループ名で購入品の検索をする
# アプリケーションを作成した背景
友人数人が推し活をする上でスケジュールや複数人で購入した商品のお金の管理が大変だと聞いたので、その問題を解決できるアプリケーションを開発することにした。
# 実装した機能についての画像やGIFおよびその説明
__・__ カレンダー変更機能
チェックボックスでカレンダーの切り替えをする。
[![Image from Gyazo](https://i.gyazo.com/eb62bba8506dcf5f3b1a271062ebaf7c.gif)](https://gyazo.com/eb62bba8506dcf5f3b1a271062ebaf7c)
__・__ 購入機能
購入品の追加をする。商品名と公演日のどちらかの入力でカレンダーAとBに予定を振り分けるので、商品名と公演日はどちらか一方にしか入力できない。
[![Image from Gyazo](https://i.gyazo.com/4112ca937cd3905c038ed5310a0865fc.gif)](https://gyazo.com/4112ca937cd3905c038ed5310a0865fc)
__・__ 検索機能
グループ名で検索することができる。
[![Image from Gyazo](https://i.gyazo.com/1a355f7ffffb6afe7b2fadf10d328432.gif)](https://gyazo.com/1a355f7ffffb6afe7b2fadf10d328432)

# データベース設計	
[![Image from Gyazo](https://i.gyazo.com/89a689f0316165f1182c2a870431dc2e.png)](https://gyazo.com/89a689f0316165f1182c2a870431dc2e)

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

# 開発環境
ruby on rails
java script

# ローカルでの動作方法
アプリケーションをクローン
% git clone https://github.com/toritori3165/oshikatsu.git
クローンしたアプリに移動
% cd oshikatsu
Gemをインストール
% bundle install

# 工夫したポイント	
開発途中で友人に実際にアプリケーションを見てもらい、フィードバックを受けながらユーザー目線で改良を重ねた。カレンダーの切り替えなどはレスポンスが早い方がユーザー的にストレスなく使用できると思いJavascriptで実装した。

# 制作時間
1週間