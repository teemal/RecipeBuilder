require "rails_helper"
RSpec.describe Ingredient do

  it "expects an Ingredient to have a name" do
    ingredient = Ingredient.new({name: "Test Ingredient"})
    expect(ingredient.name).to eq("Test Ingredient")
  end

  it "expects an Ingredient to have an amount" do
    ingredient = Ingredient.new({amount: "Test Quantity"})
    expect(ingredient.amount).to eq("Test Quantity")
  end

  it "expects an Ingredient to be done when it has both a amount and a name" do 
    ingredient = Ingredient.new({name: "Test Ingredient", amount: "Test oz"})
    expect(ingredient.done?).to be_truthy
  end
end
