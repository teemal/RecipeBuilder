require "rails_helper"

RSpec.describe CreatesStep do

  let(:description_string) { "Shake and bake." }
  let(:completed_boolean) { true }
  let(:creator) { CreatesStep.new(
    description: description_string,
    completed: completed_boolean
  )}

  describe "initialization" do
    it "creates a step given a description" do
      creator.build
      expect(creator.step.description).to eq("Shake and bake.")
    end

    it "defaults completed attribute to false" do
      creator.build_with_completed_default
      expect(creator.step.completed?).to be_falsy
    end

    it "allows setting of completed attribute" do
      creator.build
      expect(creator.step.completed?).to be_truthy
    end
  end

  describe "fails" do
    let(:description_string) { "" }

    it "when trying to save an step with no description" do
      creator = CreatesStep.new(
        description: description_string
      )
      creator.create
      expect(creator).not_to be_a_success
    end

    it "when completed attribute gets something other than a boolean" do
      creator = CreatesStep.new(
        description: "Shake and bake.",
        completed: "..."
      )
      creator.create
      expect(creator).not_to be_a_success
    end
  end
end
