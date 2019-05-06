require "rails_helper"

RSpec.describe "Utensil" do
  let(:test_utensil) { "Test Pan" }

  describe "Initialization" do
    it "creates a utensil given a name" do
      utensil = Utensil.new( name: test_utensil )
      expect(utensil.name).to eq(test_utensil)
    end
  end

  it "expects Utensil to have a name" do
    utensil = Utensil.new
    expect(utensil.completed).to be_falsy
  end

  it "expects to be able to change its name" do
    new_utensil = "Test Spatula"
    utensil = Utensil.new(name: test_utensil)
    utensil.name = new_utensil
    expect(utensil.name).to eq(new_utensil)
  end

  it "expects initial completeness to be false" do
    utensil = Utensil.new
    expect(utensil.completed?).to be_falsy
  end

  it "expects to be able to set completion status" do
    utensil = Utensil.new(name: test_utensil)
    utensil.set_completed
    expect(utensil.completed?).to be_truthy
  end

  it "expects to be able to unset completion status" do
    utensil = Utensil.new( {name: test_utensil, completed: true})
    utensil.unset_completed
    expect(utensil.completed?).to be_falsy
  end

end
