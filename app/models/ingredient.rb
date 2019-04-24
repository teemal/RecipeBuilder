class Ingredient < ApplicationRecord
  belongs_to :project

  def set_ingredient( new_ingredient )
    self.ingredient = new_ingredient
  end

  def done?
    return true if ingredient.present?
  end

end
