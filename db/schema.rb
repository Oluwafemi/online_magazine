# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141019061911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "superuser",              default: false, null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "article_categories", force: true do |t|
    t.string   "name"
    t.boolean  "allow_readers_comment", default: false, null: false
    t.boolean  "active",                default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_categories", ["name"], name: "article_cat_name", unique: true, using: :btree

  create_table "article_sub_categories", force: true do |t|
    t.string   "title"
    t.integer  "article_category_id",                   null: false
    t.boolean  "allow_readers_comment", default: false, null: false
    t.boolean  "active",                default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_sub_categories", ["title", "article_category_id"], name: "article_article_sub_idx", unique: true, using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "img_url"
    t.integer  "user_article_category_id",                 null: false
    t.string   "introduction",             default: "",    null: false
    t.string   "image"
    t.boolean  "reviewed",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "user_article_categories", force: true do |t|
    t.integer  "admin_user_id",                      null: false
    t.integer  "article_category_id",                null: false
    t.boolean  "enabled",             default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_article_categories", ["admin_user_id", "article_category_id"], name: "usr_article_cat", unique: true, using: :btree

  add_foreign_key "article_sub_categories", "article_categories", name: "article_sub_categories_article_category_id_fk"

  add_foreign_key "articles", "user_article_categories", name: "articles_user_article_category_id_fk"

  add_foreign_key "user_article_categories", "admin_users", name: "user_article_categories_admin_user_id_fk"
  add_foreign_key "user_article_categories", "article_categories", name: "user_article_categories_article_category_id_fk"

end
