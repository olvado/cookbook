class FavouriteRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  after_create :increment_favourite_count
  after_destroy :decrement_favourite_count

private

  def increment_favourite_count
    recipe.increment!(:favourite_count, 1)
  end

  def decrement_favourite_count
    recipe.decrement!(:favourite_count, 1) unless self.recipe.favourite_count == 0
  end

end
