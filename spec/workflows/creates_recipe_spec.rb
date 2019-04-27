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
    let(:ingredients) { creator.string_to_ingredients }
    let(:steps) { creator.string_to_steps }

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
        ingredient: "Stuff"
      )}
      specify { expect(steps.first).to have_attributes(
        step: "Things"
      )}
    end

    describe "with multiple items" do
      let(:ingredients_string) { "Salt\nPepper"}
      let(:steps_string) { "Shake\nBake"}
      specify { expect(ingredients).to match(
        [an_object_having_attributes(ingredient: "Salt"),
         an_object_having_attributes(ingredient: "Pepper")]
      )}
      specify { expect(steps).to match(
        [an_object_having_attributes(step: "Shake"),
         an_object_having_attributes(step: "Bake")]
      )}
    end
  end

  describe "fails" do
    let(:name_string) { "" }
    let(:ingredients_string) { "" }
    let(:steps_string) { "" }

    it "when trying to save a project with no name" do
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
