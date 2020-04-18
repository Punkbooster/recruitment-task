class AddLabelsTable < ActiveRecord::Migration[5.2]
  def up
    create_table :labels do |t|
      t.string :name, index: true
      t.text :description
      t.string :website_url

      t.timestamps
    end
  end

  def down
    drop_table :labels
  end
end
