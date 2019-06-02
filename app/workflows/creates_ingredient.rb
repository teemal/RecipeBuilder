class CreatesIngredient
  attr_accessor :ingredient, :name, :acquired, :amount

  def initialize(name: "", amount: nil, acquired: false)
    @name = name
    @amount = amount
    @acquired = acquired
  end

  def build
    self.ingredient = Ingredient.new(
      name: name,
      #amount: amount,
      acquired: acquired
    )
    ingredient
  end

  # def build_with_acquired_default
  #   self.ingredient = Ingredient.new(
  #     name: name,
  #     #amount: amount
  #   )
  #   ingredient
  # end

  def success?
    @success
  end

  def create
    build
    result = ingredient.save
    @success = result
  end
end
