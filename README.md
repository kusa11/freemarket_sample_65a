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
|description||null: false|
|comment|string|null: false|

※deviceを使って記述


### Association
- has_many :credit_card dependent: :destroy
- has_many :todo_list dependent: :destroy
- has_many :comments, through: :products dependent: :destroy
- has_many :seller_buyer, through: :products dependent: :destroy
- has_many :likes, through: :products dependent: :destroy
- has_many :street_address: :dependent: :destroy


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|


### Association
- belong_to :user
- belong_to :product


## seller_buyerテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|


### Association
- belong_to :user
- belong_to :product



### likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|null: false, foreign_key: true|
|product_id|null: false, foreign_key: true|

※deviceを使用します


### Association
- belong_to :user
- belong_to :product


## street_adressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|build|string|null: false|


### Association
-  belong_to :user


## todoテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|


### Association
-  belong_to :user


## cdedit_cardテーブル
|Column|Type|Options|
|------|----|-------|

※ pay.jpを使って記述

### Association
-  belong_to :user


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false, index: true|
|send_cost|string|null: false, |
|address|string|null: false|
|title|null: false|
|description|string|null: false|
|name|string|null: false|


### Association
- has_many :categories
- has_many :deribery_chage
- has_many :brand
- has_many :shopping_period
- has_many :condition
- has_many :prefectures dependent: :destroy
- has_many :photos dependent: :destroy
- has_many :likes, through: :users dependent: :destroy


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|


※ancestryを使って記述


### Association
- has_many :products
- has_many :categories_size, through: size



## derivery_chageテーブル
|Column|Type|Options|
|------|----|-------|
|postage_included|null: false|
|cash_on_delivery|null: false|


### Association
- belong_to :product



## brandテーブル
|Column|Type|Options|
|------|----|-------|
|CHANEL|null: false|
|NIKE|null: false|
|LOUIS_VITTON|null: false|
|Supreme|null: false|
|adidas|null: false|

※ancesatryを使用します


### Association
- has_many :products



## shoping_periedテーブル
|Column|Type|Options|
|------|----|-------|
|period|null: false|


### Association
- belong_to :product


## conditionテーブル
|Column|Type|Options|
|------|----|-------|
|brand_new|null: false|
|unused|null:false|
|no_scratches|null: false|
|A_little_scratch|null: false|
|scar|null: false|

### Association
- belong_to :product


## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|id|null: false|
|北海道||
|青森||
|岩手||


※active_hashを使用します


### Association
- belong_to :product


## photosテーブル
|Column|Type|Options|
|------|----|-------|
|id|null: false|
|item_id|null: false|
|url|null: false|

### Association
- belong_to :product


## categorie_sizeテーブル
|Column|Type|Options|
|------|----|-------|
|id|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|


### Association
- belong_to :categories
- beling_to :size



## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|kind|null: false||


### Association
- has_many :categorie_size, through: :categories
