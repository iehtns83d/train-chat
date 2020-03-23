
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