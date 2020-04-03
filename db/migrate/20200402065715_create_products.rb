class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string     :name,          null: false
      t.string     :brand
      t.text       :description,   null: false
      t.integer    :condition,     null: false
      t.integer    :delivery_fee,  null: false
      t.integer    :delivery_area, null: false
      t.integer    :delivery_day,  null: false
      t.integer    :price,         null: false
      t.references :category,      null: false, foreign_key: true
      t.references :user,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
