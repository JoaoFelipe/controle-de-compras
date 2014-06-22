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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140621040121) do

  create_table "accounts", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "system"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "email_id"
    t.integer  "facebook_id"
  end

  add_index "accounts", ["email_id"], :name => "index_accounts_on_email_id"
  add_index "accounts", ["facebook_id"], :name => "index_accounts_on_facebook_id"

  create_table "emails", :force => true do |t|
    t.string   "address"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.integer  "count",          :default => 1
    t.integer  "account_id"
    t.integer  "game_id"
    t.integer  "group_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.decimal  "price",          :default => 0.0
    t.decimal  "original_price", :default => 0.0
    t.boolean  "is_brl",         :default => true
  end

  add_index "games", ["account_id"], :name => "index_games_on_account_id"
  add_index "games", ["game_id"], :name => "index_games_on_game_id"
  add_index "games", ["group_id"], :name => "index_games_on_group_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.date     "date"
    t.decimal  "dollar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",        :limit => 50, :null => false
    t.string   "description",               :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "statuses", :force => true do |t|
    t.integer  "game_id"
    t.string   "game_name"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "statuses", ["game_id"], :name => "index_statuses_on_game_id"
  add_index "statuses", ["user_id"], :name => "index_statuses_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "role_id",                :default => 1,  :null => false
  end

  add_index "users", ["role_id"], :name => "index_users_on_role_id"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
