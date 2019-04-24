require "rails_helper"
RSpec.describe Recipe do
  it "Expects a recipe to have a name" do
    recipe = Recipe.new({name: "Test Recipe"})
    expect(recipe.name).to eq("Test Recipe")
  end

  it "Expects a recipe's name to be changeable" do
    recipe = Recipe.new()
    new_name = "Test New Recipe"
    recipe.set_name( new_name )
    expect(recipe.name).to eq(new_name)
  end

  it "Expects a recipe to not be submitable if the name is default" do
    recipe = Recipe.new
    expect(recipe).to_not be_submitable
  end
end

describe "Ingredients" do
  let (:recipe) { Recipe.new( { name: "Test Recipe" } ) }
  let (:ingredient) { Ingredient.new( { ingredient: "Test Ingredient" } ) }

  it "knows that a named recipe with incomplete ingredients is not submitable" do
    recipe.ingredients << Ingredient.new
    expect(recipe.submitable?).to be_falsy
  end

  it "expects that a named recipe with no inclompete ingredients is submitable" do
    recipe.ingredients << ingredient
    expect(recipe.submitable?).to be_truthy
  end

end

describe "Steps" do
  let (:recipe) { Recipe.new( { name: "Test Recipe" } ) }

  it "knows that a named recipe with incomplete steps is not submitable" do
    recipe.steps << Step.new
    expect(recipe.submitable?).to be_falsy
  end

  it "knows that a named recipe with completed or no steps is submittable" do
    recipe.steps << Step.new( { step: "Test Step" } ) 
    expect(recipe.submitable?).to be_truthy
  end
end
