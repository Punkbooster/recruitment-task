class ChangeProductsColumnName < ActiveRecord::Migration[5.2]
  def up
    rename_column :products, :name, :title
  end

  def down
    rename_column :products, :title, :name
  end
end
