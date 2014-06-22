class AddEmailPassToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :email_password, :string
  end
end
