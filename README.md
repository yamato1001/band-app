# README

## bands テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ | ------------------------ |
| bandname             | string | null: false              |
| email                | string | null: false, unique:true |
| encrypted_password   | string | null: false              |


### Association

- has_many :bandposts


## solos テーブル

| Column               | Type         | Options                        |
| -------------------- | ------------ | ------------------------------ |
| nickname             | string       | null: false                    |
| email                | string       | null: false                    |
| encrypted_password   | string       | null: false                    |

### Association

- has_many :soloposts

## bandposts テーブル

| Column                | Type      | Options                        |
| --------------------- | --------- | ------------------------------ |
| introduction          | text      | null: false                    |
| genre_id              | integer   | null: false                    |
| musical_instrument_id | integer   | null: false                    |
| area_id               | integer   | null: false                    |
| history               | string    | null: false                    |
| band                  | reference | null: false, foreign_key: true |

### Association

- belongs_to :band

## soloposts テーブル

| Column                | Type      | Options                        |
| --------------------- | --------- | ------------------------------ |
| introduction          | text      | null: false                    |
| genre_id              | integer   | null: false                    |
| musical_instrument_id | integer   | null: false                    |
| area_id               | integer   | null: false                    |
| favorite_band         | string    |                                |
| history               | string    | null: false                    |
| solo                  | reference | null: false, foreign_key: true |

### Association

- belongs_to :log