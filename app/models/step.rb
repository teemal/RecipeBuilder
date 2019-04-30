class Step < ApplicationRecord
  after_initialize :default_values

  validates :description, presence: true

  belongs_to :recipe

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
