# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_many :favorites
- has_one :profile

## rooms テーブル

| column | Type | Options |
| ------ | ---- | ------- |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## favorites テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| profile | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :profile

## profiles テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| nickname  | string     | null: false                    |
| image     | string     |                                |
| comment   | string     |                                |
| content   | text       |                                |
| twitter   | string     |                                | 
| instagram | string     |                                |
| rate      | float      |                                |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :profile_tags
- has_many :tags, through: :profile_tags
- has_many :favorites

## tags テーブル

| Column   | Type   | Options |
| -------- | ------ | ------- |
| tag_name | string |         |

### Association

- has_many :profile_tags
- has_many :profiles, through: :profile_tags

## profile_tag テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| profile | references | null: false, foreign_key: true |
| tag     | references | null: false, foreign_key: true |

### Association

- belongs_to :profile
- belongs_to :tag