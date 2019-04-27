class Recipe < ApplicationRecord
  validates :name, presence: true

  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy

  def incomplete_ingredients
    ingredients.reject(&:done?)
  end

  def incomplete_steps
    steps.reject(&:done?)
  end

  def submittable?
    name.present? && incomplete_ingredients.empty? && incomplete_steps.empty?
  end

end
