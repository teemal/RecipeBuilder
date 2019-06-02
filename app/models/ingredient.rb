class Ingredient < ApplicationRecord
  after_initialize :default_values

  validates :name, presence: true

  has_many :measurements
  has_many :recipes, through: :measurement

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
  end
end
