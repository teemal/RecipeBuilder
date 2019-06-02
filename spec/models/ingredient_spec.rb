require "rails_helper"

RSpec.describe Ingredient do
  #let(:test_name) { "Flour" }

  # describe "initialization" do
  #   let(:recipe) { FactoryBot.build_stubbed(:recipe) }
  #   # let(:ingredient_with_name) { FactoryBot.build_stubbed(:ingredient_with_name) }
  #   # let(:ingredient_without_name) { FactoryBot.build_stubbed(:ingredient) }

  #   it "creates an ingredient given a name" do
  #     expect(ingredient_with_name.valid?).to be_truthy
  #   end

  #   it "fails if not given a name" do
  #     expect(ingredient_without_name.valid?).to be_falsy
  #   end
  # end

  # describe "mutation" do
  #   let(:recipe) { FactoryBot.build_stubbed(:recipe) }
  #   let(:complete_ingredient) { FactoryBot.build_stubbed(:complete_ingredient) }
  #   let(:incomplete_ingredient) { FactoryBot.build_stubbed(:incomplete_ingredient) }

  #   it "expects to be able to change its name" do
  #     expect(complete_ingredient.name).to eq('Complete Ingredient')
  #     new_ingredient = "Sugar"
  #     complete_ingredient.name = new_ingredient
  #     expect(complete_ingredient.name).to eq(new_ingredient)
  #   end
  
  #   it "expects to be able set whether or not acquired" do
  #     expect(incomplete_ingredient.acquired?).to be_falsy
  #     incomplete_ingredient.set_acquired
  #     expect(incomplete_ingredient.acquired?).to be_truthy
  #     incomplete_ingredient.unset_acquired
  #     expect(incomplete_ingredient.acquired?).to be_falsy
  #   end
  # end

  # describe "amount tests" do
  #   let(:complete_ingredient) {FactoryBot.build_stubbed(:ingredient, name: "Fake ingredient", amount: 50) }
  #   it "checks if an amount is present" do
  #     expect(complete_ingredient.amount).to eq(50)
  #   end

  #   it "expects a name is true and an amount to be true" do
  #     expect(complete_ingredient.name).to be_truthy
  #     expect(complete_ingredient.amount).to be_truthy
  #   end

  #   it "expects to be able tot change its amount" do
  #     expect(complete_ingredient.amount).to eq(50)
  #     new_amount = 15
  #     complete_ingredient.amount = new_amount
  #     expect(complete_ingredient.amount).to eq(new_amount)
  #   end
  # end
end
