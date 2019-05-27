require "rails_helper"

RSpec.describe "adding a recipe", type: :system do
  it "allows a user to create a recipe with name/ingredients/steps" do
    visit new_recipe_path
    fill_in "Name", with: "Pancakes"
    fill_in "Utensils", with: "Test Pan"
    fill_in "Ingredients", with: "Flour\nEgg"
    fill_in "Steps", with: "Mix\nMake"
    fill_in "Cuisine", with: "American"
    click_on("Create Recipe")
    visit recipes_path
    @recipe = Recipe.find_by(name: "Pancakes")
    expect(page).to have_selector(
      "#recipe_#{@recipe.id} .name", text: "Pancakes"
    )
  end

end

