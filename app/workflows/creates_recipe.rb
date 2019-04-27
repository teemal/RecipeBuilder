class CreatesRecipe
  attr_accessor :name, :recipe, :steps_string, :ingredients_string

  def initialize(name: "", ingredients_string: "", steps_string: "")
    @name = name
    @ingredients_string = ingredients_string
    @steps_string = steps_string
  end

  def build
    self.recipe = Recipe.new(
      name: name,
      ingredients: string_to_ingredients,
      steps: string_to_steps
    )
    recipe
  end

  def success?
    @success
  end

  def create
    build
    result = recipe.save
    @success = result
  end

  def string_to_ingredients
    @ingredients_string.split("\n").map do |ingredient|
      Ingredient.new(ingredient: ingredient)
    end
  end

  def string_to_steps
    @steps_string.split("\n").map do |step|
      Step.new(step: step)
    end
  end

end
