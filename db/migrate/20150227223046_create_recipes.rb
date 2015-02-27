class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :slug, null: false, unique: true
      t.text :excerpt
      t.text :body
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :recipes, :slug
    add_index :recipes, :user_id

  end
end
