class AddDateToProduct < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :released_at, :datetime, null: false
  end

  def down
    remove_column :products, :released_at, :datetime
  end
end
