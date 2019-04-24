require "rails_helper"

RSpec.describe "adding a recipe", type: :system do
  it "allows a user to create a recipe with steps" do
    visit new_recipe_path
    fill_in "Name", with: "Test Pancakes"
    fill_in "Ingredient", with: "Test pancake"
    fill_in "Step", with: "Cook Test Pancake"
    click_on("Create Recipe")
    visit recipes_path
    expect(page).to have_content("Test Pancakes")
    expect(page).to have_content(8)
  end
end

