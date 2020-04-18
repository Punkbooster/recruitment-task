class AddGenresTable < ActiveRecord::Migration[5.2]
  def up
    create_table :genres do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table :genres
  end
end
