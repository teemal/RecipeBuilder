require "rails_helper"

RSpec.describe Ingredient do
  let(:test_ingredient) { "Flour" }

  describe "initialization" do
    it "creates an ingredient given a name" do
      ingredient = Ingredient.new(name: test_ingredient)
      expect(ingredient.name).to eq(test_ingredient)
    end
  end

  it "expects to have an ingredient" do
    ingredient = Ingredient.new
    expect(ingredient.save).to be_falsy
  end

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
