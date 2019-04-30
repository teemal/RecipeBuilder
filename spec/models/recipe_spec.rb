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

  it "expects cuisine to be optional" do
    recipe = Recipe.new(name: test_name)
    expect(recipe.save).to be_truthy
  end

  it "expects cuisine to be changeable" do
    recipe = Recipe.new(name: test_name)
    expect(recipe.cuisine).to eq("Unknown")
    recipe.cuisine = "French"
    expect(recipe.cuisine).to eq("French")
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

    it "expects to be able to get a count of ingredients" do
      recipe.ingredients << ingredient << ingredient
      expect(recipe.ingredient_count).to eq(2)
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

    it "expects to be able to get a count of steps" do
      recipe.steps << step << step
      expect(recipe.step_count).to eq(2)
    end
  end
end
