
class RemoveAllForeignKeys < ActiveRecord::Migration
  def up
    create_table "users_temp", :force => true do |t|
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
      t.integer  "role_id", foreign_key: false,                :default => 1,  :null => false
    end
    execute "INSERT INTO users_temp(id,name,hashed_password,salt,created_at,updated_at,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,confirmation_token,confirmed_at,confirmation_sent_at,failed_attempts,unlock_token,locked_at,role_id)
      SELECT id,name,hashed_password,salt,created_at,updated_at,email,encrypted_password,reset_password_token,reset_password_sent_at,remember_created_at,sign_in_count,current_sign_in_at,last_sign_in_at,current_sign_in_ip,last_sign_in_ip,confirmation_token,confirmed_at,confirmation_sent_at,failed_attempts,unlock_token,locked_at,role_id FROM users"
    
    drop_table :users
    rename_table :users_temp, :users

    add_index :users, :role_id
  end

  def down
  end
end
