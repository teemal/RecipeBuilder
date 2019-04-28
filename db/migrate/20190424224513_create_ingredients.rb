class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.references :recipe, foreign_key: true
      t.string :name
      t.decimal :amount, precision: 7, scale: 1
      t.boolean :acquired

      t.timestamps
    end
  end
end
