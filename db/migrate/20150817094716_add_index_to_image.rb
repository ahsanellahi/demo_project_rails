class AddIndexToImage < ActiveRecord::Migration
  def change
    add_index :images, [:imageable_id, :imageable_type], unique: true
  end
end
