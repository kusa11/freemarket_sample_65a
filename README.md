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
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

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
|body|text|null: false|
|user_id|integer|null: false|


### Association
-  belong_to :user



## cdedit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|

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
|user_id|references|null: false, foreign_key: true|
|shipping_peried_id|references|null: false, foreign_key: true|
|condetion_id|references|null: false, foreign_key: true|


### Association
- belong_to :categorie
- belong_to :deribery_chage
- belong_to :brand
- belomg_to :shopping_period
- belong_to :condition
- belong_to :prefectures dependent: :destroy
- has_many :photos dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :seller_buyer, through: users dependent: :destroy
- has_many :comments, through: :users dependent: :destroy



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



## shipping_periedテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|


### Association
- belong_to :product


## conditionテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|text|string|null: false|



### Association
- belong_to :product



## photosテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false|
|product_id||references|null: false, foreign_key: true|
|url|string|null: false|

### Association
- belong_to :product