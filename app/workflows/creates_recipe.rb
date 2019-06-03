class CreatesRecipe
  attr_accessor :recipe, :name, :steps_string, :ingredients_string, :utensils_string, :cuisine_string

  def initialize(name: "", ingredients_string: "", steps_string: "", utensils_string: "", time: "")
    @name = name
    @ingredients_string = ingredients_string
    @steps_string = steps_string
    @utensils_string = utensils_string
    @cuisine_string = cuisine_string
  end

  def build
    self.recipe = Recipe.new(
      name: @name,
      ingredients: convert_ingredients_string,
      steps: convert_steps_string,
      utensils: convert_utensils_string,
      cuisine: cuisine_string,
      #time: time
    )
    recipe
  end

  def success?
    @success
  end

  def create
    build
    result = recipe.save
    #byebug
    @success = result
  end

  def convert_ingredients_string
    @ingredients_string.split("\n").map do |ingredient|
      Ingredient.new(name: ingredient.strip)
    end
  end

  def convert_steps_string
    @steps_string.split("\n").map.with_index(1) do |step, index|
      Step.new(description: step.strip, number: index)
    end
  end

  def convert_utensils_string
    @utensils_string.split("\n").map do |utensil|
      Utensil.new(name: utensil.strip)
    end
  end

end
