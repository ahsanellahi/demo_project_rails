class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, null: false
      t.references :order, null: false

      t.timestamps
    end
    add_index :order_items, [:product_id, :order_id], unique: true
  end
end
