require "rails_helper"

RSpec.describe CreatesIngredient do

  let(:name_string) { "Flour" }
  let(:amount_integer) { 2 }
  let(:acquired_boolean) { true }
  let(:creator) { CreatesIngredient.new(
    name: name_string,
    amount: amount_integer,
    acquired: acquired_boolean
  )}

  describe "initialization" do
    it "creates an ingredient given a name" do
      creator.build
      expect(creator.ingredient.name).to eq("Flour")
    end

    # it "creates an ingredient given an amount" do
    #   creator.build
    #   expect(creator.ingredient.amount).to eq(2)
    # end

    # it "defaults acquired attribute to false" do
    #   creator.build_with_acquired_default
    #   expect(creator.ingredient.acquired?).to be_falsy
    # end

    it "allows setting of aquired attribute" do
      creator.build
      expect(creator.ingredient.acquired?).to be_truthy
    end
  end

  describe "fails" do
    let(:name_string) { "" }
    let(:amount_integer) { nil }

    it "when trying to save an ingredient with no name" do
      creator = CreatesIngredient.new(
        name: name_string
      )
      creator.create
      expect(creator).not_to be_a_success
    end

    it "will not save an ingredient with no amount" do
      creator = CreatesIngredient.new(
        amount: amount_integer
      )
      creator.create
      expect(creator).not_to be_a_success
    end

    it "when acquired attribute gets something other than a boolean" do
      creator = CreatesIngredient.new(
        name: "Flour",
        acquired: "..."
      )
      creator.build
      expect(creator).not_to be_a_success
    end
  end
end
