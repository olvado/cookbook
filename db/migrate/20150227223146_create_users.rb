class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
    add_index :users, :username
    add_index :users, :slug
  end
end
