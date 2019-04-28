require "rails_helper"

RSpec.describe Recipe do
  let(:test_name) { "Pancakes" }

  describe "initialization" do
    it "creates a recipe given a name" do
      recipe = Recipe.new(name: test_name)
      expect(recipe.name).to eq(test_name)
    end
  end

  it "expects to have a name" do
    recipe = Recipe.new
    expect(recipe.save).to be_falsy
  end

  it "expects the name to be changeable" do
    new_name = "Toast"
    recipe = Recipe.new(name: test_name)
    recipe.name = new_name
    expect(recipe.name).to eq(new_name)
  end

  describe "with ingredients" do
    let(:recipe) { Recipe.new(name: test_name) }
    let(:ingredient) { Ingredient.new(name: "Bananas") }

    it "expects that a recipe with incomplete ingredients is not submittable" do
      recipe.ingredients << Ingredient.new
      expect(recipe.submittable?).to be_falsy
    end

    it "expects that a recipe with all ingredients acquired is submittable" do
      ingredient.set_acquired
      recipe.ingredients << ingredient
      expect(recipe.submittable?).to be_truthy
    end
  end

  describe "with steps" do
    let(:recipe) { Recipe.new(name: test_name) }
    let(:step) { Step.new(description: "Shake and bake.") }

    it "expects that a recipe with incomplete steps is not submittable" do
      recipe.steps << step
      expect(recipe.submittable?).to be_falsy
    end

    it "expects that a recipe with all steps completed is submittable" do
      step.set_completed
      recipe.steps << step
      expect(recipe.submittable?).to be_truthy
    end
  end
end
