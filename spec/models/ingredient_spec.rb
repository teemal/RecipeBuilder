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

  it "expects an Ingredient to have an amount" do
    ingredient = Ingredient.new({amount: "Test Quantity"})
    expect(ingredient.amount).to eq("Test Quantity")
  end

  it "expects to be able to set amount to something new" do
    new_amount = "New Test Amount"
    ingredient = Ingredient.new
    ingredient.set_amount(new_amount)
    expect(ingredient.amount).to eq(new_amount)
  end

  it "expects an Ingredient to be done when it has both a amount and a name" do 
    ingredient = Ingredient.new({ingredient: "Test Ingredient", amount: "Test oz"})
    expect(ingredient.done?).to be_truthy
  end

end
