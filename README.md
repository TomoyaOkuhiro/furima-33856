# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| e-mail             | string              | null: false             |
| password           | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_year         | string              | null: false             |
| birth_month        | string              | null: false             |
| birth_day          | string              | null: false             |


### Association

- has_many :item


## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| description                         | text       | null: false       |
| price                               | string     | null: false       |


## Association

- belongs_to :user


### Supplement(補足)

画像データはActive Storageを用いて実装
データ選択にはActive Hashを用いて実装
