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

  def set_name( new_name )
    @name = new_name
  end

  def amount
    @amount
  end

  def set_amount( new_amount )
    @amount = new_amount
  end

  def done?
    return true if @name != DEFAULT_NAME && @amount != DEFAULT_AMOUNT 
  end

end
