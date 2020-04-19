class AddProductGenreTable < ActiveRecord::Migration[5.2]
  def up
    create_table :product_genres do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :genre, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :product_genres
  end
end
