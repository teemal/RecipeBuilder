class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @workflow = CreatesRecipe.new(
      name: params[:recipe][:name],
      ingredients_string: params[:recipe][:ingredients],
      steps_string: params[:recipe][:steps]
    )
    @workflow.create
    redirect_to recipes_path
  end
end
