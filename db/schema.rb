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

ActiveRecord::Schema.define(version: 20161229063512) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "action"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "full_name"
    t.string   "avatar"
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_albums_on_club_id", using: :btree
  end

  create_table "club_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description",     limit: 65535
    t.string   "action"
    t.boolean  "approve",                       default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["organization_id"], name: "index_club_requests_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_club_requests_on_user_id", using: :btree
  end

  create_table "clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "image"
    t.string   "notification"
    t.string   "description"
    t.integer  "money",                      default: 0
    t.float    "rating",          limit: 24, default: 0.0
    t.boolean  "is_active",                  default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["organization_id"], name: "index_clubs_on_organization_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.integer  "news_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["news_id"], name: "index_comments_on_news_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "event_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",       limit: 65535
    t.integer  "expense",                         default: 0
    t.integer  "club_id"
    t.integer  "event_category_id"
    t.date     "date_start"
    t.date     "date_end"
    t.string   "location"
    t.integer  "num_like",                        default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["club_id"], name: "index_events_on_club_id", using: :btree
    t.index ["event_category_id"], name: "index_events_on_event_category_id", using: :btree
  end

  create_table "hobbies_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "album_id"
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_images_on_album_id", using: :btree
    t.index ["user_id"], name: "index_images_on_user_id", using: :btree
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.string   "image"
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "approve",                  default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["event_id"], name: "index_news_on_event_id", using: :btree
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.string   "phone"
    t.string   "email"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "target_hobbies_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "hobbies_tag_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["hobbies_tag_id"], name: "index_target_hobbies_tags_on_hobbies_tag_id", using: :btree
  end

  create_table "user_clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.boolean  "is_manager", default: false
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["club_id"], name: "index_user_clubs_on_club_id", using: :btree
    t.index ["user_id"], name: "index_user_clubs_on_user_id", using: :btree
  end

  create_table "user_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_user_events_on_club_id", using: :btree
    t.index ["event_id"], name: "index_user_events_on_event_id", using: :btree
    t.index ["user_id"], name: "index_user_events_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "full_name"
    t.string   "avatar"
    t.string   "phone"
    t.integer  "role"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_users_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "activities", "users"
  add_foreign_key "albums", "clubs"
  add_foreign_key "club_requests", "organizations"
  add_foreign_key "club_requests", "users"
  add_foreign_key "clubs", "organizations"
  add_foreign_key "comments", "news"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "clubs"
  add_foreign_key "events", "event_categories"
  add_foreign_key "images", "albums"
  add_foreign_key "images", "users"
  add_foreign_key "news", "events"
  add_foreign_key "news", "users"
  add_foreign_key "target_hobbies_tags", "hobbies_tags"
  add_foreign_key "user_clubs", "clubs"
  add_foreign_key "user_clubs", "users"
  add_foreign_key "user_events", "clubs"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "users", "organizations"
end
