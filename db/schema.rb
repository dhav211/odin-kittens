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

ActiveRecord::Schema[7.1].define(version: 2024_04_14_222118) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "followers", force: :cascade do |t|
    t.integer "kitten_id", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kitten_id"], name: "index_followers_on_kitten_id"
    t.index ["owner_id"], name: "index_followers_on_owner_id"
  end

  create_table "image_posts", force: :cascade do |t|
    t.integer "kitten_id", null: false
    t.integer "owner_id", null: false
    t.text "body"
    t.string "title"
    t.bigint "likes_id"
    t.index ["kitten_id"], name: "index_image_posts_on_kitten_id"
    t.index ["likes_id"], name: "index_image_posts_on_likes_id"
    t.index ["owner_id"], name: "index_image_posts_on_owner_id"
  end

  create_table "kittens", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.integer "image_posts_id"
    t.integer "followers_id"
    t.datetime "date_of_birth"
    t.string "color"
    t.string "gender"
    t.integer "profile_picture_id"
    t.index ["followers_id"], name: "index_kittens_on_followers_id"
    t.index ["image_posts_id"], name: "index_kittens_on_image_posts_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "image_post_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_post_id"], name: "index_likes_on_image_post_id"
    t.index ["owner_id"], name: "index_likes_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "kittens_id"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["kittens_id"], name: "index_owners_on_kittens_id"
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "followers", "kittens"
  add_foreign_key "followers", "owners"
  add_foreign_key "image_posts", "kittens"
  add_foreign_key "image_posts", "likes", column: "likes_id"
  add_foreign_key "image_posts", "owners"
  add_foreign_key "kittens", "followers", column: "followers_id"
  add_foreign_key "kittens", "image_posts", column: "image_posts_id"
  add_foreign_key "likes", "image_posts"
  add_foreign_key "likes", "owners"
  add_foreign_key "owners", "kittens", column: "kittens_id"
end
