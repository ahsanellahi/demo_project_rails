class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :token, limit: 30, null: false
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
