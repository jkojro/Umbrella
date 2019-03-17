ActiveRecord::Schema.define(version: 2019_03_17_102201) do

  create_table "umbrellas", force: :cascade do |t|
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
