class Ingredient < ApplicationRecord
  before_save :default_values
  validates :name, presence: true

  belongs_to :recipe


  def acquired?
    acquired
  end

  private

  def default_values
    self.acquired = acquired.presence || false
  end
end
