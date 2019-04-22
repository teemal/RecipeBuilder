require "rails_helper"

RSpec.describe "Step" do
  let (:step) { Step.new( { description: "Test Step" } ) }

  it "expects Step to have a description" do
    expect(step.description).to eq("Test Step")
  end

  it "expects Step to be done when it has a description that is not the default description" do
    expect(step.done?).to be_truthy
  end

  it "expects Step to be able to set description to something new" do
    step.set_description("Test New Description")
    expect(step.description).to eq("Test New Description")
  end

end
