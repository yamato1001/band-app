# README

## users テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| nickname             | string | null: false              |
| email                | string | null: false, unique:true |
| encrypted_password   | string | null: false              |


### Association

- has_many :bandposts
- has_many :soloposts

## bandposts テーブル

| Column                | Type      | Options                        |
| --------------------- | --------- | ------------------------------ |
| bandname              | string    | null: false                    |
| introduction          | text      | null: false                    |
| genre_id              | integer   | null: false                    |
| musical_instrument_id | integer   | null: false                    |
| area_id               | integer   | null: false                    |
| history               | string    |                                |
| sns_account           | text      |                                |
| user                  | reference | null: false, foreign_key: true |

### Association

- belongs_to :user

## soloposts テーブル

| Column                | Type      | Options                        |
| --------------------- | --------- | ------------------------------ |
| nickname              | string    | null: false                    |
| introduction          | text      | null: false                    |
| genre_id              | integer   | null: false                    |
| musical_instrument_id | integer   | null: false                    |
| area_id               | integer   | null: false                    |
| favorite_band         | string    |                                |
| history               | string    |                                |
| sns_account           | text      |                                |
| user                  | reference | null: false, foreign_key: true |

### Association

- belongs_to :user