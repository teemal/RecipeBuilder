class Ingredient
  DEFAULT_NAME = "Ingredient"
  DEFAULT_AMOUNT = "None"

  attr_accessor :ingredient, :amount

  def initialize(args = {})
    @ingredient = args.fetch(:ingredient, DEFAULT_NAME)
    @amount = args.fetch(:amount, DEFAULT_AMOUNT)
  end

  def ingredient
    @ingredient
  end

  def set_ingredient( new_ingredient )
    @ingredient = new_ingredient
  end

  def amount
    @amount
  end

  def set_amount( new_amount )
    @amount = new_amount
  end

  def done?
    return true if @ingredient != DEFAULT_NAME && @amount != DEFAULT_AMOUNT 
  end

end
