require "rails_helper"
RSpec.describe Ingredient do

  it "expects an Ingredient to have an ingredient" do
    ingredient = Ingredient.new({ingredient: "Test Ingredient"})
    expect(ingredient.ingredient).to eq("Test Ingredient")
  end

  it "expects an Ingredients to be able to change its name" do
    new_ingredient = "New Test Ingredient"
    ingredient = Ingredient.new
    ingredient.set_ingredient(new_ingredient)
    expect(ingredient.ingredient).to eq(new_ingredient)
  end

  it "expects an Ingredient to be done when it has both a amount and a name" do 
    ingredient = Ingredient.new({ingredient: "Test Ingredient"})
    expect(ingredient.done?).to be_truthy
  end

end
