class RecipeDecorator < Draper::Decorator
  delegate_all

  def favourited(user)
    user.favourites.include?(self)
  end

  def favourited_class(user)
    favourited(user) ? " is_active" : ""
  end

end
