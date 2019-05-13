require "rails_helper"

RSpec.describe Recipe do
  let(:test_name) { "Pancakes" }
  let(:test_cuisine) { "Breakfast" }

  describe "initialization" do
    let(:recipe_with_name) { FactoryBot.build_stubbed(:recipe, name: :test_name) }
    let(:recipe_without_name) { FactoryBot.build_stubbed(:recipe) }

    it "creates a recipe given a name" do
      expect(recipe_with_name.valid?).to be_truthy
    end

    it "fails if not given a name" do
      expect(recipe_without_name.valid?).to be_falsy
    end
  end

  describe "mutation" do
    let(:recipe) { FactoryBot.build_stubbed(:recipe, 
                                            name: test_name,
                                            cuisine: test_cuisine) }

    it "expects the name to be changeable" do
      expect(recipe.name).to eq(test_name)
      new_name = "Spagetti"
      recipe.name = new_name
      expect(recipe.name).to eq(new_name)
    end

    it "expects cuisine to be changeable" do
      expect(recipe.cuisine).to eq(test_cuisine)
      new_cuisine = "Italian"
      recipe.cuisine = new_cuisine
      expect(recipe.cuisine).to eq(new_cuisine)
    end
  end

  describe "with ingredients" do
    let(:recipe) { FactoryBot.build(:recipe, 
                                            name: test_name,
                                            cuisine: test_cuisine) }
    let(:complete_ingredient) { FactoryBot.build(:complete_ingredient) }
    let(:incomplete_ingredient) { FactoryBot.build(:incomplete_ingredient) }

    it "expects that a recipe with incomplete ingredients is not submittable" do
      recipe.ingredients << incomplete_ingredient
      expect(recipe.submittable?).to be_falsy
    end

    it "expects that a recipe with all ingredients acquired is submittable" do
      recipe.ingredients << complete_ingredient
      expect(recipe.submittable?).to be_truthy
    end

    it "expects to be able to get a count of ingredients" do
      recipe.ingredients << complete_ingredient << incomplete_ingredient
      expect(recipe.ingredient_count).to eq(2)
    end
  end
  /
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
      expect(recipe).to have_num_steps(2)
    end
  end
  /
end
