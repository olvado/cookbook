class CreateFavouriteRecipes < ActiveRecord::Migration
  def change
    create_table :favourite_recipes, id: false do |t|
      t.references :recipe, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
    add_index :favourite_recipes, [:recipe_id, :user_id], unique: true
  end
end
