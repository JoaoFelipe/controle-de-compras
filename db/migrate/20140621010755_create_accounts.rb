class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :password
      t.string :system
      t.string :email
      t.string :facebook

      t.timestamps
    end
  end
end
