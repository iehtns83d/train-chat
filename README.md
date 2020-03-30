## アプリ名
RealTime Stations

## 概要
駅のリアルタイムの情報をチャット形式で共有するアプリケーション

## 本番環境
# デプロイ先
http://13.113.210.95
# テストアカウント
* メールアドレス: 11111@gmail.com
* パスワード: 11111111

## 制作背景
人身事故・遅延による混雑状況の情報を共有することで混雑を少しでも回避することを目的としています。

## どんな課題や不便なことを解決するためにこのアプリを作ったのか。
人身事故・遅延が起こると時刻表が乱れ、駅の混雑状況が気になり不安になっていました。  
駅のアナウンスでどの駅で何が起こったのかは知ることはできますが、駅の混雑状況を確認することはできません。  
そこで、混雑している駅の情報を画像やチャットを用いて共有できれば良いと思い作成しました。  

## DEMO
* 使用する路線の駅を選択し、その駅のチャットがリアルタイムで行うことができます
![demo](https://user-images.githubusercontent.com/58354561/77869884-f4fcb480-727a-11ea-83c8-1f07bcfc4829.jpg)
![demo](https://user-images.githubusercontent.com/58354561/77870132-8835ea00-727b-11ea-87b2-b3d7fe6d1429.gif)

## 工夫したポイント
同じ駅で路線が違うと混雑状況は変わるので、チャットを路線毎に分けました。  
非同期通信にすることでよりリアルタイムでチャットができるように実装しました。  
表示画面をできるだけシンプルでコンパクトを意識しました。  

## 使用技術(開発環境)
* ruby 2.5.1
* rails 5.2.4.1
* JQuery 4.3.5
* MySQL 5.6.47
* Haml 5.1.2
* Sass 3.7.4
* AWS(EC2・S3)
* Github

## 課題や今後実装したい機能
* 路線の各、急、快、特で選択できるようにする。  
* 駅を選択せずとも、一目で混雑しているかどうかが判別できるようにチャットの多いところの色を変化させる。  

## DB設計
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