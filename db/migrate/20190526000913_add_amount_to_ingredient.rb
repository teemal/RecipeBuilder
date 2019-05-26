class AddAmountToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :amount, :integer
  end
end
