# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| kana_name          | string              | null: false             |
| birthday           | integer             | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| price                               | string     | null: false       |
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
| postal-cord              | text       | null: false       |
| prefecture               | text       | null: false       |
| address                  | text       | null: false       |
| building-name            | text       | null: false       |
| phone-num                | integer    | null: false       |
| item_id                  | references | foreign_key: true |
| phone-num                | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order

