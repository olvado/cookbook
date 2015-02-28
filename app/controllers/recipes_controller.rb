class RecipesController < ApplicationController
  def index
    @author = User.find(params[:user_id]) unless params[:user_id].nil?
    @recipes = @author.nil? ? Recipe.all : @author.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end
end
