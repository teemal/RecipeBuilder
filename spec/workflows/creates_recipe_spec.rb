require "rails_helper"

RSpec.describe CreatesRecipe do

  let(:name_string) { "Pancakes" }
  let(:creator) { CreatesRecipe.new(
    name: name_string,
    ingredients_string: ingredients_string,
    steps_string: steps_string
  )}

  describe "initialization" do
    let(:ingredients_string) { "" }
    let(:steps_string) { "" }

    it "creates a recipe given a name" do
      creator.build
      expect(creator.recipe.name).to eq("Pancakes")
    end
  end

  describe "string parsing" do
    let(:ingredients) { creator.convert_ingredients_string }
    let(:steps) { creator.convert_steps_string }

    describe "handles empty strings" do
      let(:ingredients_string) { "" }
      let(:steps_string) { "" }
      specify { expect(ingredients).to be_empty }
      specify { expect(steps).to be_empty }
    end

    describe "with a single item" do
      let(:ingredients_string) { "Stuff" }
      let(:steps_string) { "Things" }
      specify { expect(ingredients.first).to have_attributes(
        name: "Stuff"
      )}
      specify { expect(steps.first).to have_attributes(
        description: "Things"
      )}
    end

    describe "with multiple items" do
      let(:ingredients_string) { "Salt\nPepper"}
      let(:steps_string) { "Shake\nBake"}
      specify { expect(ingredients).to match(
        [an_object_having_attributes(name: "Salt"),
         an_object_having_attributes(name: "Pepper")]
      )}
      specify { expect(steps).to match(
        [an_object_having_attributes(description: "Shake"),
         an_object_having_attributes(description: "Bake")]
      )}
    end
  end

  describe "fails" do
    let(:name_string) { "" }
    let(:ingredients_string) { "" }
    let(:steps_string) { "" }

    it "when trying to save a recipe with no name" do
      creator = CreatesRecipe.new(
        name: name_string,
        ingredients_string: ingredients_string,
        steps_string: steps_string
      )
      creator.create
      expect(creator).not_to be_a_success
    end
  end
end
