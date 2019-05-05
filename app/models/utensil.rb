class Utensil < ApplicationRecord

  validates :name, presence: true

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
    self.completed = completed.presence || false
  end
end
