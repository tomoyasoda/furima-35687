# DB 設計

## users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| nickname           | string              | null: false, unique:tru    |
| email              | string              | null: false, unique:true   |
| encrypted_password | string              | null: false                |
| first-name         | string              | null: false                |
| last-name          | string              | null: false                |
| first-kana_name    | string              | null: false                |
| last-kana_name     | string              | null: false                |
| date               | integer             | null: false                |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| price                               | integer    | null: false       |
| buy-item-info                       | text       | null: false       |
| category                            | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one : shipping-address

## orders table

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| credit-card-num          | integer    | null: false       |
| expiration-date          | integer    | null: false       |
| security-num             | integer    | null: false       |
| item                     | references | foreign_key: true |
| user                     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping-address

## shipping-address table

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| postal-cord              | integer    | null: false       |
| prefecture               | string     | null: false       |
| address                  | string     | null: false       |
| building-name            | string     | null: false       |
| phone-num                | string     | null: false       |
| order_id                 | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order

