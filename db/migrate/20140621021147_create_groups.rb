class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :url
      t.date :date
      t.decimal :dollar

      t.timestamps
    end
  end
end
