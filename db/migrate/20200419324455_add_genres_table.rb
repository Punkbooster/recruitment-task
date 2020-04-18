class AddGenresTable < ActiveRecord::Migration[5.2]
  def up
    create_table :genres do |t|
      t.string :name, index: true
      t.text :description
      t.belongs_to :product, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :genres
  end
end
