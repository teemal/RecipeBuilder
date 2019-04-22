require "rails_helper"

RSpec.describe "adding a recipe", type: :system do
  it "allows a user to create a recipe with steps", :pending  do
    visit new_recipe_path
    fill_in "Name", with: "Test Pancakes"
    fill_in "Ingredient", with: "Test pancake"
  end
end

