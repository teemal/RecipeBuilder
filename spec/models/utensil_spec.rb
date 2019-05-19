require "rails_helper"

RSpec.describe "Utensil" do
  let(:test_utensil) { "Test Pan" }
  let(:utensil) { FactoryBot.build_stubbed(:utensil) }

  describe "Initialization" do
    it "creates a utensil given a name" do
      expect(utensil.name).to eq(test_utensil)
    end
  end

  it "expects Utensil to have a name" do
    utensil = Utensil.new
    expect(utensil.completed).to be_falsy
  end

  it "expects to be able to change its name" do
    new_utensil = "Test Spatula"
    utensil.name = new_utensil
    expect(utensil.name).to eq(new_utensil)
  end

  it "expects initial completeness to be false" do
    utensil = Utensil.new
    expect(utensil.completed?).to be_falsy
  end

  it "expects to be able to set completion status" do
    utensil.set_completed
    expect(utensil.completed?).to be_truthy
  end

  it "expects to be able to unset completion status" do
    utensil.set_completed
    expect(utensil.completed?).to be_truthy
    utensil.unset_completed
    expect(utensil.completed?).to be_falsy
  end

  it "expects to be able to perfrom" do
    result = utensil.perform(BigDependency.new)
    expect(result).to eq(42)
  end

  it "expects to be able to perfrom with a fake" do
    result = utensil.perform(FakeBigDependency.new)
    expect(result).to eq(42)
  end

end
