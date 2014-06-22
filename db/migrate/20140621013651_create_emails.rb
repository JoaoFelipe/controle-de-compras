class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.string :password

      t.timestamps
    end
  end
end
