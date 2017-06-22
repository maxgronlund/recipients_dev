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

ActiveRecord::Schema.define(version: 20170621105002) do

  create_table "families", force: :cascade do |t|
    t.integer "organization_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_families_on_organization_id"
  end

  create_table "message_contents", force: :cascade do |t|
    t.integer "message_subject_id"
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.index ["message_subject_id"], name: "index_message_contents_on_message_subject_id"
    t.index ["user_id"], name: "index_message_contents_on_user_id"
  end

  create_table "message_recipients", force: :cascade do |t|
    t.integer "message_subject_id"
    t.string "reciveable_type"
    t.integer "reciveable_id"
    t.boolean "read"
    t.boolean "send_email"
    t.boolean "post_on_site"
    t.boolean "send_to_e_boks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_subject_id"], name: "index_message_recipients_on_message_subject_id"
    t.index ["reciveable_type", "reciveable_id"], name: "index_message_recipients_on_reciveable_type_and_reciveable_id"
  end

  create_table "message_subjects", force: :cascade do |t|
    t.string "title"
    t.string "messageble_type"
    t.integer "messageble_id"
    t.integer "user_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messageble_type", "messageble_id"], name: "index_message_subjects_on_messageble_type_and_messageble_id"
    t.index ["organization_id"], name: "index_message_subjects_on_organization_id"
    t.index ["user_id"], name: "index_message_subjects_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_users_on_family_id"
  end

end
