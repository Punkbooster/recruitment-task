class AddProductsTable < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
      t.string :name, index: true
      t.text :description
      t.decimal :price, precision: 8, scale: 2, null: false
      t.belongs_to :label, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
