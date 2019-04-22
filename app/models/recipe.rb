class Recipe

  DEFAULT_NAME = "Unamed Recipe"
  attr_accessor :name, :ingredients, :steps

  def initialize(args = {})
    @name = args.fetch(:name, DEFAULT_NAME)
    @ingredients = []
    @steps = []
  end
  
  def name
    @name
  end

  def set_name( new_name )
    @name = new_name
  end

  def incomplete_ingredients
    ingredients.reject(&:done?)
  end

  def incomplete_steps
    steps.reject(&:done?)
  end

  def submitable?
    return true if @name != DEFAULT_NAME && incomplete_ingredients.empty? && incomplete_steps.empty?
  end

end
