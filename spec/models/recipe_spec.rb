require "rails_helper"
RSpec.describe Recipe do
  it "Expects a recipe to have a name" do
    recipe = Recipe.new({name: "Test Recipe"})
    expect(recipe.name).to eq("Test Recipe")
  end

  it "Expects a recipe to handle an empty name" do
    recipe = Recipe.new()
    expect(recipe.name).to eq("Unamed Recipe")
  end

  it "Expects a recipe to not be submitable if the name is default" do
    recipe = Recipe.new
    expect(recipe).to_not be_submitable
  end
end

describe "Ingredients" do
  let (:recipe) { Recipe.new( { name: "Test Recipe" } ) }
  let (:ingredient) { Ingredient.new( { name: "Test Ingredient", amount: "1" } ) }

  it "knows that a named recipe without ingredients is not submitable" do
    expect(recipe.submitable?).to be_falsy
  end

  it "expects that a named recipe with completed ingredients is submitable" do
    recipe.ingredients << ingredient
    expect(recipe.submitable?).to be_truthy
  end
end
