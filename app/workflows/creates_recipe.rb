class CreatesRecipe
  attr_accessor :recipe, :name, :steps_string, :ingredients_string

  def initialize(name: "", ingredients_string: "", steps_string: "")
    @name = name
    @ingredients_string = ingredients_string
    @steps_string = steps_string
  end

  def build
    self.recipe = Recipe.new(
      name: @name,
      ingredients: convert_ingredients_string,
      steps: convert_steps_string
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

  def convert_ingredients_string
    @ingredients_string.split("\n").map do |ingredient|
      Ingredient.new(name: ingredient.strip)
    end
  end

  def convert_steps_string
    @steps_string.split("\n").map do |step|
      Step.new(description: step.strip)
    end
  end
end
