require "rails_helper"

RSpec.describe "Step" do
  let(:test_step) { "Shake and bake." }

  describe "initialization" do
    it "creates a step given a description" do
      step = Step.new(description: test_step)
      expect(step.description).to eq(test_step)
    end
  end

  it "expects Step to have a description" do
    step = Step.new
    expect(step.save).to be_falsy
  end

  it "expects to be able to change its description" do
    new_step = "Bake and shake."
    step = Step.new(description: new_step)
    step.description = new_step
    expect(step.description).to eq(new_step)
  end

  it "expects to be able to set whether or not completed" do
    step = Step.new(description: test_step)
    expect(step.completed?).to be_falsy
    step.set_completed
    expect(step.completed?).to be_truthy
    step.unset_completed
    expect(step.completed?).to be_falsy
  end
end
