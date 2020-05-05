# FURIMAアプリ DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, index: true|
|email|string|null: false|
|password|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false|

※deviceを使って記述

### Association
- has_many :credit_card dependent: :destroy
- has_many :todo_list dependent: :destroy
- has_many :comments, through: :products dependent: :destroy
- has_many :seller_buyer, through: :products dependent: :destroy
- has_many :products dependent: :destroy
- has_many :street_address: :dependent: :destroy



## seller_buyerテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product



## adressテーブル
|Column|Type|Options|
|------|----|-------|
|frist_name|string|null: false|
|last_name|string|null: false|
|frist_name_kana|string|null: false|
|last_name_kana|string|null: false|
|post_number|intger|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_number|string|null: false|
|buildng|string|null: false|
|user|references|null: false, foreign_key: true|
|phone_number|intger|null: false|


### Association
-  belongs_to :user



## todoテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user|references|null: false, foreign_key: true|

### Association
-  belongs_to



## cdedit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|card_id|integer|null: false|

※ pay.jpを使って記述

### Association
-  belongs_to :user



## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition|integer|null: false|
|delivery_fee|integer|null: false|
|prefecture|integer|null: false|
|delivery_day|integer|null: false|
|price|integer|null: false|
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :user
- has_many :images dependent: :destroy



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

※ancestryを使って記述

### Association
- has_many :products



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :product