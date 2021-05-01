# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| encrypted_password | string              | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_day          | date                | null: false              |



### Association

- has_many :items
- belongs_to :purchase_management




## items table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| name_id                             | string     | null: false, foreign_key: true|
| description                         | text       | null: false                   |
| price                               | string     | null: false                   |
| category                            | integer    | null: false, foreign_key: true|
| status_id                           | integer    | null: false, foreign_key: true|
| shipping_cost_id                    | integer    | null: false, foreign_key: true|
| shipping_area_id                    | integer    | null: false, foreign_key: true|
| shipping_day_id                     | integer    | null: false, foreign_key: true|



### Association

- belongs_to :user
- belongs_to :purchase_management




## address table

| Column            | Type            | Options                       |
|-------------------|-----------------|-------------------------------|
| user_id           | integer         | null: false, foreign_key: true|
| post_code         | string          | null: false                   |
| prefecture        | string          | null: false                   |
| city              | string          | null: false                   |
| address           | string          | null: false                   |
| building_name     | string          |                               |
| phone_number      | string          | null: false                   |

### Association

- has_one :purchase_management



## purchase_management table

| Column                 | Type    | Options          |
|------------------------|---------|------------------|
| purchase_management_id | integer | foreign_key: true|
| item_id                | integer | foreign_key: true|


has_one :address
belongs_to :user
has_many :items



#### Supplement(補足)

画像データはActive Storageを用いて実装
データ選択にはActive Hashを用いて実装
