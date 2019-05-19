class Utensil < ApplicationRecord
  after_initialize :default_values

  validates :name, presence: true

  belongs_to :recipe


  def perform(big_dependency)
    big_dependency.execute
    return 42
  end
  def completed?
    completed
  end

  def set_completed
    self.completed = true
  end

  def unset_completed
    self.completed = false
  end

  private

  def default_values
    self.completed = completed.presence || false
  end
end
