class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :body
      t.decimal :price

      t.timestamps
    end
  end
end
