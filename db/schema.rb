ActiveRecord::Schema.define(version: 20171229124622) do

  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string   "originator"
    t.string   "recipient"
    t.string   "content"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
