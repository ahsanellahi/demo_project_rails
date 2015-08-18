class RemoveIndexFromImage < ActiveRecord::Migration
  def up
    remove_index :images, [:imageable_id, :imageable_type]
  end

  def down
    add_index :images, [:imageable_id, :imageable_type], unique: true
  end
end
