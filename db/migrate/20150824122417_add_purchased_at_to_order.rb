class AddPurchasedAtToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :purchased_at, :date
  end

  def down
    remove_column :orders, :purchased_at
  end
end
