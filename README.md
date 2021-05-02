# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| nickname           | string              | null: false              |
| email              | string              | null: false,              |
| encrypted_password | string              | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_name_kana     | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_day          | date                | null: false              |



### Association

- has_many :items
- has_many :purchase_managements




## items table

| Column                              | Type       | Options                       |
|-------------------------------------|------------|-------------------------------|
| name                                | string     | null: false                   |
| description                         | text       | null: false                   |
| price                               | integer    | null: false                   |
| category_id                         | integer    | null: false                   |
| status_id                           | integer    | null: false                   |
| shipping_cost_id                    | integer    | null: false                   |
| shipping_area_id                    | integer    | null: false                   |
| shipping_day_id                     | integer    | null: false                   |
| user                                | references | null: false, foreign_key: true|



### Association

- belongs_to :user
- has_one :purchase_management




## Addresses table

| Column                           | Type            | Options                       |
|----------------------------------|-----------------|-------------------------------|
| purchase_management              | references      | null: false, foreign_key: true|
| post_code                        | string          | null: false                   |
| phone_number                     | string          | null: false                   |
| shipping_area_id                 | integer         | null: false                   |


### Association

- belongs_to :purchase_management



## purchase_managements table

| Column                 | Type      | Options          |
|------------------------|-----------|------------------|
| user                   | references| foreign_key: true|
| item                   | references| foreign_key: true|


has_one :address
belongs_to :user
belongs_to :item



#### Supplement(補足)

画像データはActive Storageを用いて実装
データ選択にはActive Hashを用いて実装
