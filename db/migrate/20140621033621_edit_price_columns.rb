class EditPriceColumns < ActiveRecord::Migration
  def change
  	remove_column :games, :brl_price
  	remove_column :games, :uss_price
  	remove_column :games, :brl_original
  	remove_column :games, :uss_original
  	add_column :games, :price, :decimal, :default => 0
  	add_column :games, :original_price, :decimal, :default => 0
  	add_column :games, :is_brl, :boolean, :default => true
  	change_column :games, :count, :integer, :default => 1
  end
end
