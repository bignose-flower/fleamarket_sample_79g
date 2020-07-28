class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :item_status, null: false
      t.integer :shipping_fee, null: false
      t.string :owner_area, null: false
      t.integer :shipping_date, null: false
      t.integer :seller_id, index: true
      t.integer :buyer_id, index: true
      # t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end
