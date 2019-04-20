require "rails_helper"
RSpec.describe Recipe do
  it "Epects a recipe to have a name" do
    recipe = Recipe.new({name: "Test Recipe"})
    expect(recipe.name).to eq("Test Recipe")
  end

  it "Expects a recipe to handle an empty name" do
    recipe = Recipe.new()
    expect(recipe.name).to eq("Unamed Recipe")
  end

  it "Expects a recipe to be submitable if the name is not default" do
    recipe = Recipe.new({name: "Test Submitable"})
    expect(recipe).to be_submitable
  end

  it "Expects a recipe to not be submitable if the name is default" do
    recipe = Recipe.new
    expect(recipe).to_not be_submitable
  end

end
