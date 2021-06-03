# DB 設計

## users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| nickname           | string              | null: false, unique:true   |
| email              | string              | null: false, unique:true   |
| encrypted_password | string              | null: false                |
| first_name         | string              | null: false                |
| last_name          | string              | null: false                |
| first_kana_name    | string              | null: false                |
| last_kana_name     | string              | null: false                |
| birthday           | date                | null: false                |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| price                               | integer    | null: false       |
| buy_item_info                       | text       | null: false       |
| category                            | integer    | null: false       |
| item_condition                      | integer    | null: false       |
| item_charge                         | integer    | null: false       |
| shipping_area                       | integer    | null: false       |
| shipping_day                        | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| item                     | references | foreign_key: true |
| user                     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address

## shipping_address table

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| postal_cord              | string     | null: false       |
| prefecture_id            | integer    | null: false       |
| municipality             | string     | null: false       |
| address                  | string     | null: false       |
| building_name            | string     |                   |
| phone_num                | string     | null: false       |
| order                    | references | foreign_key: true |

### Association

- belongs_to :order

