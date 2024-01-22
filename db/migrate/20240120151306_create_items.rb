class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :info, null: false
      t.integer :category_id, null: false
      t.integer :item_status_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :prefecture, null: false
      t.integer :scheduled_delivery, null: false
      t.string :price, null: false
      t.timestamps
    end
  end
end
