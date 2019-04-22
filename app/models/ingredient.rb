class Ingredient
  DEFAULT_NAME = "Ingredient"
  DEFAULT_AMOUNT = "None"

  attr_accessor :name, :amount

  def initialize(args = {})
    @name = args.fetch(:name, DEFAULT_NAME)
    @amount = args.fetch(:amount, DEFAULT_AMOUNT)
  end

  def name
    @name
  end

  def amount
    @amount
  end

  def done?
    return true if @name != DEFAULT_NAME && @amount != DEFAULT_AMOUNT 
  end

end
