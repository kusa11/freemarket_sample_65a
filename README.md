# FURIMAアプリ DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false, index: true|
|last_name|string|null: false|
|family_name_Furigana|string|null: false|
|last_name_Furigana|string|null: false|
|nickname|string|null: false|
|mail-address|string|null: false, unique: true|
|password|string|null: false|
|birthday|string|null: false|
|description|string|null: false|
|comment|string|null: false|

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



## street_adressテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|build|string|null: false|

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