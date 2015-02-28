class AddFavouriteCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :favourite_count, :integer, default: 0, null: false

    add_index :recipes, [:favourite_count]
  end
end
