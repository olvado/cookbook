class RecipesController < ApplicationController

  def index
    @author = User.find(params[:user_id]).decorate unless params[:user_id].nil?
    @recipes = @author.nil? ? Recipe.all.decorate : @author.recipes.decorate
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

  def favourite
    @recipe = Recipe.find(params[:id])
    if !@current_user.favourites.include?(@recipe)
      @current_user.favourites << @recipe
      action = "added"
    else
      @current_user.favourites.destroy(@recipe)
      action = "removed"
    end

    respond_to do |format|
      format.json { render json: @recipe.reload.to_json }
      format.html { redirect_to :back, notice: "Recipe #{action} from favourites." }
    end
  end

protected

  def permitted_params
    params.require(:recipe).permit(
        :title, :body, :user_id,
        :ingredient_list
      )
  end

end
