# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| e-mail             | string              | null: false, unique: true|
| encrypted_password | string              | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_day          | date                | null: false              |



### Association

- has_many :items


## items table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| name                                | string     | null: false                   |
| description                         | text       | null: false                   |
| price                               | string     | null: false                   |
| category                            | integer    | null: false, foreign_key: true|
| status                              | integer    | null: false, foreign_key: true|
| shipping_cost                       | integer    | null: false, foreign_key: true|
| shipping_area                       | integer    | null: false, foreign_key: true|
| shipping_day                        | integer    | null: false, foreign_key: true|



### Association

- belongs_to :user
- has_many :items



## address table

| Column            | Type            | Options                       |
|-------------------|-----------------|-------------------------------|
| user_id           | integer         | null: false, foreign_key: true|
| post_code         | integer         | null: false, foreign_key: true|
| prefecture        | string          | null: false                   |
| city              | string          | null: false                   |
| address           | string          | null: false                   |
| building_name     | string          |                               |
| phone_number      | integer         |                               |

### Association

- has_many :items
- has_many :users


## purchase_management table

| Column       | Type    | Options          |
|--------------|---------|------------------|
| user_id      |integer  | foreign_key: true|

has_one :address



#### Supplement(補足)

画像データはActive Storageを用いて実装
データ選択にはActive Hashを用いて実装
