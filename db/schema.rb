# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_19_324459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_labels_on_name"
  end

  create_table "product_genres", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_product_genres_on_genre_id"
    t.index ["product_id", "genre_id"], name: "index_product_genres_on_product_id_and_genre_id", unique: true
    t.index ["product_id"], name: "index_product_genres_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2, null: false
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "released_at"
    t.index ["label_id"], name: "index_products_on_label_id"
    t.index ["title"], name: "index_products_on_title"
  end

  add_foreign_key "product_genres", "genres"
  add_foreign_key "product_genres", "products"
  add_foreign_key "products", "labels"
end
