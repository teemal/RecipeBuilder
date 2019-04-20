class Recipe

  DEFAULT_NAME = "Unamed Recipe"
  attr_accessor :name

  def initialize(args = {})
    @name = args.fetch(:name, DEFAULT_NAME)
  end
  
  def name
    @name
  end

  def submitable?
    return true if @name != DEFAULT_NAME
  end
end
