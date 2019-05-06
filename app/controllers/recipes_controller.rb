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
      steps_string: params[:recipe][:steps],
      utensils_string: params[:recipe][:utensils]
    )

    @workflow.create

    if @workflow.success?
      redirect_to recipes_path
    else
      @recipe = @workflow.recipe
      render :new
    end
  end
end
