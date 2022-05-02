class RecipesController < ApplicationController
  def index
    if params[:search].present?
      @recipes = Recipe.search_ingredient(params['search']&.split(' '))
    else
      @recipes = Recipe.all
    end
    @recipes = @recipes.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :image, :description, :search)
  end

end