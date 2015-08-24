class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, null: false
      t.float :subtotal
      t.float :total

      t.timestamps
    end
  end
end
