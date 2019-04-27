class Step < ApplicationRecord
  before_save :default_values
  validates :description, presence: true

  belongs_to :recipe

  def completed?
    completed
  end

  private

  def default_values
    self.completed = completed.presence || false
  end
end
