ActiveRecord::Schema.define(version: 20150227231645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favourite_recipes", id: false, force: :cascade do |t|
    t.integer  "recipe_id",  null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favourite_recipes", ["recipe_id", "user_id"], name: "index_favourite_recipes_on_recipe_id_and_user_id", unique: true, using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "slug",       null: false
    t.text     "excerpt"
    t.text     "body"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipes", ["slug"], name: "index_recipes_on_slug", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.string   "slug",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
