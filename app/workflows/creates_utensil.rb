class CreatesUtensil
  attr_accessor :utensil, :name, :completed

  def initialize( name: "", completed: false)
    @name = name
    @completed = completed
  end

  def build
    self.utensil = Utensil.new(
      name: name,
      completed: completed
    )
    utensil
  end

  def build_with_completed_default
    self.utensil = Utensil.new(
      name: name
    )
    utensil
  end

  def success?
    @success
  end

  def create
    build
    result = utensil.save
    @success = result
  end
end
