class RecipesController < ApplicationController
  def index
    @author = User.find(params[:user_id]).decroate unless params[:user_id].nil?
    @recipes = RecipeDecorator.decorate_collection(@author.nil? ? Recipe.all : @author.recipes.decorate)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = @current_user.recipes.new
  end

  def create
    @recipe = @current_user.recipes.new(permitted_params)
    if @recipe.save
      redirect_to @current_user, notice: "Recipe created."
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(permitted_params)
      redirect_to @current_user, notice: "Recipe created."
    else
      render :new
    end
  end

protected

  def permitted_params
    params.require(:recipe).permit(
        :title,
        :body,
        :user_id
      )
  end

end
