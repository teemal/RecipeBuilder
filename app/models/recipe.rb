class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy


  def set_name( new_name )
    self.name = new_name
  end

  def incomplete_ingredients
    ingredients.reject(&:done?)
  end

  def incomplete_steps
    steps.reject(&:done?)
  end

  def submitable?
    return true if name.present? && incomplete_ingredients.empty? && incomplete_steps.empty?
  end

end
