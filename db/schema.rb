ActiveRecord::Schema.define(version: 2019_03_17_144852) do

  create_table "friends", force: :cascade do |t|
    t.string "email", null: false
    t.text "answear", null: false
    t.integer "umbrela_id"
    t.index ["umbrela_id"], name: "index_friends_on_umbrela_id"
  end

  create_table "umbrellas", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
