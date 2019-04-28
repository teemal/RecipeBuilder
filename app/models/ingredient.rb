class Ingredient < ApplicationRecord
  before_save :default_values

  validates :name, presence: true
  validates :amount, presence: true
  validates :acquired, presence: true

  belongs_to :recipe

  def acquired?
    acquired
  end

  def set_acquired
    self.acquired = true
  end

  def unset_acquired
    self.acquired = false
  end

  private

  def default_values
    self.acquired = acquired.presence || false
    self.amount = amount.presense || 0.0
  end
end
