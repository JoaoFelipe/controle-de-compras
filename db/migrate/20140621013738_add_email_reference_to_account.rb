class AddEmailReferenceToAccount < ActiveRecord::Migration
  def change
  	remove_column :accounts, :email_password
  	remove_column :accounts, :email
  	remove_column :accounts, :facebook
  	add_column :accounts, :email_id, :integer
  	add_column :accounts, :facebook_id, :integer
  	add_index :accounts, :email_id
  	add_index :accounts, :facebook_id
  end
end
