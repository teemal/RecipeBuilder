class CreatesIngredient
  attr_accessor :ingredient, :name, :acquired

  def initialize(name: "", acquired: false)
    @name = name
    @acquired = acquired
  end

  def build
    self.ingredient = Ingredient.new(
      name: name,
      acquired: acquired
    )
    ingredient
  end

  def build_with_acquired_default
    self.ingredient = Ingredient.new(
      name: name
    )
    ingredient
  end

  def success?
    @success
  end

  def create
    build
    result = ingredient.save
    @success = result
  end
end
