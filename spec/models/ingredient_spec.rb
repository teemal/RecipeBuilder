require "rails_helper"

RSpec.describe Ingredient do
  let(:test_name) { "Flour" }

  describe "initialization" do
    let(:recipe) { FactoryBot.build_stubbed(:recipe) }
    let(:ingredient_with_name) { FactoryBot.build_stubbed(:ingredient, name: test_name) }
    let(:ingredient_without_name) { FactoryBot.build_stubbed(:ingredient) }

    it "creates an ingredient given a name" do
      expect(ingredient_with_name.valid?).to be_truthy
    end

    it "fails if not given a name" do
      expect(ingredient_without_name.valid?).to be_falsy
    end
  end
/
  describe "mutation" do
    it "expects to be able to change its name" do
      new_ingredient = "Sugar"
      ingredient = Ingredient.new(name: test_ingredient)
      ingredient.name = new_ingredient
      expect(ingredient.name).to eq(new_ingredient)
    end
  
    it "expects to be able set whether or not acquired" do
      ingredient = Ingredient.new(name: test_ingredient)
      expect(ingredient.acquired?).to be_falsy
      ingredient.set_acquired
      expect(ingredient.acquired?).to be_truthy
      ingredient.unset_acquired
      expect(ingredient.acquired?).to be_falsy
    end
  end
  /
end
