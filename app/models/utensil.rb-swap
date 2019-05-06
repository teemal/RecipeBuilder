class Utensil 

  attr_accessor :name, :completed


  def initialize(options = {})
    @name = options.fetch(:name, "")
  end

  def completed?
    return false if @name == ""
    completed
  end

  def set_completed
    @completed = true
  end

  def unset_completed
    @completed = false
  end

end
