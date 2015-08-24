class AddColumnToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :address, :text, null: false
  end

  def down
    remove_column :orders, :address
  end
end
