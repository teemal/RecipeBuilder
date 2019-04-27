require "rails_helper"

RSpec.describe CreatesIngredient do

  let(:name_string) { "Flour" }
  let(:acquired_boolean) { true }
  let(:creator) { CreatesIngredient.new(
    name: name_string,
    acquired: acquired_boolean
  )}

  describe "initialization" do
    it "creates an ingredient given a name" do
      creator.build
      expect(creator.ingredient.name).to eq("Flour")
    end

    it "defaults acquired attribute to false" do
      creator.build_with_acquired_default
      expect(creator.ingredient.acquired?).to be_falsy
    end

    it "allows setting of aquired attribute" do
      creator.build
      expect(creator.ingredient.acquired?).to be_truthy
    end
  end

  describe "fails" do
    let(:name_string) { "" }

    it "when trying to save an ingredient with no name" do
      creator = CreatesIngredient.new(
        name: name_string
      )
      creator.create
      expect(creator).not_to be_a_success
    end
  end
end
