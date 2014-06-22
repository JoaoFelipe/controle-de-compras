class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.decimal :uss_price
      t.decimal :brl_price
      t.integer :count
      t.references :account
      t.decimal :uss_original
      t.decimal :brl_original
      t.references :game
      t.references :group
      t.timestamps
    end
    add_index :games, :account_id
    add_index :games, :game_id
    add_index :games, :group_id
  end
end
