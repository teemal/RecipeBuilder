class AddAcquiredToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :acquired, :boolean
  end
end
