
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :station_users
- has_many :stations, through: :station_users
- has_many :line_users
- has_many :lines, through: :line_users

## linesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :line_stations
- has_many :stations, through: :line_stations
- has_many :line_users
- has_many :users, through: :line_users

## stationsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :messages
- has_many :line_stations
- has_many :lines, through: :line_stations
- has_many :station_users
- has_many :users, through: :station_users

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|image|string||
|line_id|references :line|foreign_key: true|
|station_id|references :station|foreign_key: true|
|user_id|references :user|foreign_key: true|

### Association
- belongs_to :line
- belongs_to :station
- belongs_to :user

## line_stationsテーブル
|Column|Type|Options|
|------|----|-------|
|line_id|references :line|foreign_key: true|
|station_id|references :station|foreign_key: true|

### Association
- belongs_to :line
- belongs_to :station

## line_usersテーブル
|Column|Type|Options|
|------|----|-------|
|line_id|references :line|foreign_key: true|
|user_id|references :user|foreign_key: true|

### Association
- belongs_to :line
- belongs_to :user

## station_usersテーブル
|Column|Type|Options|
|------|----|-------|
|station_id|references :station|foreign_key: true|
|user_id|references :user|foreign_key: true|

### Association
- belongs_to :station
- belongs_to :user


## アプリ名
RealTime Stations
## 概要(このアプリでできることを書いて下さい)
駅のリアルタイムの情報をチャット形式で共有するアプリ
## 本番環境(デプロイ先　テストアカウント＆ID)
## 制作背景(意図)
人身事故・遅延による混雑状況の情報を共有することで混雑を少しでも回避することを目的としています。
## どんな課題や不便なことを解決するためにこのアプリを作ったのか。
人身事故・遅延が起こると時刻表が乱れ、駅の混雑状況が気になり不安になっていました。
駅のアナウンスでどの駅で何が起こったのかは知ることはできますが、駅の混雑状況を確認することはできません。
そこで、混雑している駅の情報を画像やチャットを用いて共有できれば良いと思い作成しました。
## DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
## 特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。
## 工夫したポイント
同じ駅で路線が違うと混雑状況は変わるので、チャットを路線毎に分けました。
非同期通信にすることでよりリアルタイムでチャットができるように実装しました。

## 使用技術(開発環境)
## 課題や今後実装したい機能
・路線を選択する際に非同期通信で行う
・各、急、快、特で駅を分ける

## DB設計
