class AddUniqueIndexToProductGenre < ActiveRecord::Migration[5.2]
  def up
    add_index :product_genres, %i[product_id genre_id], unique: true
  end

  def down
    remove_index :product_genres, %i[product_id genre_id]
  end
end
