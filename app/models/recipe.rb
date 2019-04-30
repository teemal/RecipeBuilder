class Recipe < ApplicationRecord
  after_initialize :default_values

  validates :name, presence: true
  validates :cuisine, presence: true

  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy

  def incomplete_ingredients
    ingredients.reject(&:acquired?)
  end

  def incomplete_steps
    steps.reject(&:completed?)
  end

  def submittable?
    incomplete_ingredients.empty? && incomplete_steps.empty?
  end

  private

  def default_values
    self.cuisine = cuisine.presence || "Unknown"
  end
end
