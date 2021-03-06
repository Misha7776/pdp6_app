# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_14_174450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "author"
    t.string "title"
    t.text "body"
    t.string "tags"
    t.boolean "published"
    t.datetime "published_on", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_view "db_statistics", materialized: true, sql_definition: <<-SQL
      SELECT 'People'::text AS "table",
      count(*) AS count
     FROM people
  UNION
   SELECT 'Posts'::text AS "table",
      count(*) AS count
     FROM posts
  UNION
   SELECT 'Products'::text AS "table",
      count(*) AS count
     FROM products;
  SQL
end
