## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| position           | string | null: false               |

### Association

- has_many :reports
- has_many :comments

## reports テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| format_id       | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| title           | string     | null: false                    |
| headline        | text       | null: false                    |
| text            | text       | null: false                    |
| date            | date       | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| report          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :report
