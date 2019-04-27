class CreatesStep
  attr_accessor :step, :description, :completed

  def initialize(description: "", completed: false)
    @description = description
    @completed = completed
  end

  def build
    self.step = Step.new(
      description: description,
      completed: completed
    )
    step
  end

  def build_with_completed_default
    self.step = Step.new(
      description: description
    )
    step
  end

  def success?
    @success
  end

  def create
    build
    result = step.save
    @success = result
  end
end
