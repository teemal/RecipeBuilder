require "rails_helper"

RSpec.describe "adding a recipe", type: :system do
  it "allows a user to create a recipe with ingredients/steps" do
    visit new_recipe_path
    fill_in "Name", with: "Pancakes"
    fill_in "Ingredients", with: "Flour\nEgg"
    fill_in "Steps", with: "Mix\nMake"
    click_on("Create Recipe")
    visit recipes_path
    expect(page).to have_content("Pancakes")
  end
end

