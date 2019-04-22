require "rails_helper"
RSpec.describe Ingredient do

  it "expects an Ingredient to have a name" do
    ingredient = Ingredient.new({name: "Test Ingredient"})
    expect(ingredient.name).to eq("Test Ingredient")
  end

  it "expects an Ingredients to be able to change its name" do
    new_name = "New Test Ingredient"
    ingredient = Ingredient.new
    ingredient.set_name(new_name)
    expect(ingredient.name).to eq(new_name)
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
    ingredient = Ingredient.new({name: "Test Ingredient", amount: "Test oz"})
    expect(ingredient.done?).to be_truthy
  end

end
