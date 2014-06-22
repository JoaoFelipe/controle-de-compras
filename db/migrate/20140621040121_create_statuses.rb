class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :game
      t.string :game_name
      t.references :user
      t.string :status

      t.timestamps
    end
    add_index :statuses, :game_id
    add_index :statuses, :user_id
  end
end
