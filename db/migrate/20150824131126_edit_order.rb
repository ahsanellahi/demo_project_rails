class EditOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :user_id
    add_column :orders, :user_id, :integer
  end

  def down
    remove_column :orders, :user_id
    add_column :orders, :user_id, :integer, null: false
  end
end
