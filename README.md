# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database ER chart
<img width="633" alt="スクリーンショット 2020-07-22 19 25 52" src="https://user-images.githubusercontent.com/66852865/88165808-3f060d80-cc51-11ea-8d78-de5ee6dd07d6.png">

## Users
| Column                | Type       | Options                  |
| :-------------------- | -----------| ------------------------ |
| id                    | integer    |                          |
| nickname              | string     | null:false               |
| email                 | email      | null:false               |
| password              | string     | null:false, unique: true |
| password_configration | string     | null:false, unique:true  |
| first_name            | string     | null:false               |
| family_name           | string     | null:false               |
| furigana_first        | string     | null:false               |
| furigana_family       | string     | null:false               |
| birthday              | date       | null:false               |
| user_id               | references | foreign_key:true         |

### association
has_one :account
has_one :address
has_one :credit
has_many :items

## Addresses
| Column               | Type       | Options          |
| -------------------- | ---------- | ---------------- |
| id                   | integer    |                  |
| shipping_first_name  | string     | null:false       |
| shipping_family_name | string     | null:false       |
| zipcode              | string     | null:false       |
| prefecture           | string     | null:false       |
| city                 | string     | null:false       |
| address              | string     | null:false       |
| others               | string     | null:false       |
| phone_number         | string     | null:false       |
| user_id              | references | foreign_key:true |

### association
belongs_to :user


## Credits
| Column      | Type       | Options          |
| ----------- | ---------- | ---------------- |
| id          | integer    |                  |
| user_id     | references | foreign_key:true |
| customer_id | string     |                  |
| card_id     | string     |                  |

### asscociation
belongs_to :user

## Items
| Column        | Type       | Options          |
| ------------- | ---------- | ---------------- |
| id            | integer    |                  |
| name          | string     | null:false       |
| description   | text       | null:false       |
| item_status   | string     | null:false       |
| shipping_fee  | integer    | null:false       |
| owner_area    | string     | null:false       |
| shipping_date | integer    | null:false       |
| seller_id     | references | foreign_key:true |
| buyer_id      | references | foreign_key:true |
| category_id   | references | foreign_key:true |
| brand_id      | references | foreign_key:true |

### association
belongs_to :user
belongs_to :category
has_many :images
belongs_to :brand

## Images
| Column  | Type       | Options          |
| ------- | ---------- | ---------------- |
| id      | integer    |                  |
| image   | text       |                  |
| item_id | references | foreign_key:true |

### association
belongs_to :item

### association

## brands
| Column     | Type       | Options    |
| ---------- | -----------| ---------- |
| id         | integer    |            |
| name       | string     | null:false |

### association
has_many :items

## categories
| Column        | Type    | Options    |
| ------------- | ------- | ---------- |
| id            | integer |            |
| name          | string  | null:false |
| ancestry      | integer |            |

### association
has_many :items

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

zxczxczxczasdas