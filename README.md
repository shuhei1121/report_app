# ReportApp
報告書作成アプリです<br>
報告書を簡単に作成、提出することができます<br>
自分宛の報告書は一覧とは別にトップページに表示されます
![](https://i.gyazo.com/6f2acea80ec39c055052bbe89e0f4a86.jpg)<br>

## URL
https://report-app-1121.herokuapp.com/

- テストアカウント
  - email : test123@com<br>
  - password : test123<br>

## 使用技術
- Ruby 2.6.5
- Ruby on Rails 6.0.3.4
- MySQL5.6.47
- Docker/Docker-compose
- RSpec

## 実装
- 機能一覧          
  - ユーザー登録、ログイン機能(devise)
  - 報告書作成機能
  - 報告書提出機能
  - ページネーション機能(kaminari)
  - マイページ機能
  - 検索機能

- DEMO
  - トップページ：https://gyazo.com/6f2acea80ec39c055052bbe89e0f4a86
  - 報告書作成画面：https://gyazo.com/a23abaaebb5f1417cdfa6c55c3738db9
  - 報告書閲覧画面：https://gyazo.com/84df67c6d9133bf1eea243076ac0c147

- 今後の課題・実装予定
  - CircleCI導入
  - 第２フォーマット作成
  - コメント機能
  - 既読機能    

## 制作背景
- 目的<br>
  日々の業務の中で多々作成する報告書を一元管理し、簡単に作成できるようにすれば業務効率を向上させられると思い、作成に至りました。<br>      

- 工夫<br>
  トップページの報告書の数が増えてきた時見づらいと感じたためページネーション機能を実装しました。また一眼でどんな報告書かわかるようにカテゴリーごとに画像を配置しました。<br>

## DB設計
### users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| position           | string | null: false               |

#### Association

- has_many :reports

### reports テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| format_id       | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| title           | string     | null: false                    |
| headline        | text       | null: false                    |
| text            | text       | null: false                    |
| date            | date       | null: false                    |
| receiver        | string     |                                |
| user            | references | null: false, foreign_key: true |

#### Association

- belongs_to :user