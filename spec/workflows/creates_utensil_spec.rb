require "rails_helper"

RSpec.describe CreatesUtensil do
  let(:test_name) { "Test pan" }
  let(:test_completed) { true }
  let(:test_creator) {
    CreatesUtensil.new(
      name: test_name,
      completed: test_completed
    )}

  describe "initialization" do
    it "creates a utensil given a name" do
      test_creator.build
      expect(test_creator.utensil.name).to eq(test_name)
    end

    it "defaults completed attribute to false" do
      test_creator.build_with_completed_default
      expect(test_creator.utensil.completed?).to be_falsy
    end

    it "allows setting of completed attribute" do
      test_creator.build
      expect(test_creator.utensil.completed?).to be_truthy
    end
  end

  describe "fails" do
    let(:test_name) { "" }

    it "when trying to save a utensil with no name" do
      test_creator = CreatesUtensil.new(
        name: test_name
      )
      test_creator.create
      expect(test_creator).not_to be_a_success
    end
    it "when completed attribute gets something other than a boolean" do
      test_creator = CreatesUtensil.new(
        name: "Test Pan",
        completed: "..."
      )
      test_creator.create
      expect(test_creator).not_to be_a_success
    end
  end
end
