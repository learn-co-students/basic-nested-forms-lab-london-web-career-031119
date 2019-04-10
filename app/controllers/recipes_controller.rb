class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.create(params_recipe)
    redirect_to @recipe
  end

  private
  def params_recipe
    params.require(:recipe).permit(:title, ingredients_attributes: [:id, :name, :quantity])
  end
end
