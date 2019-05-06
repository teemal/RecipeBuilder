require "rails_helper"

RSpec.describe "adding a recipe", type: :system do
  it "allows a user to create a recipe with name/ingredients/steps" do
    visit new_recipe_path
    fill_in "Name", with: "Pancakes"
    fill_in "Utensils", with: "Test Pan"
    fill_in "Ingredients", with: "Flour\nEgg"
    fill_in "Steps", with: "Mix\nMake"
    click_on("Create Recipe")
    visit recipes_path
    @recipe = Recipe.find_by(name: "Pancakes")
    expect(page).to have_selector(
      "#recipe_#{@recipe.id} .name", text: "Pancakes"
    )
  end

  it "does not allow a user to create a recipe without a name" do
    visit new_recipe_path
    fill_in "Name", with: ""
    fill_in "Ingredients", with: "Flour\nEgg"
    fill_in "Steps", with: "Mix\nMake"
    click_on("Create Recipe")
    expect(page).to have_selector(".new_recipe")
  end
end

