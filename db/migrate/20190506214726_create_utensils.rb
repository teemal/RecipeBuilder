class CreateUtensils < ActiveRecord::Migration[5.2]
  def change
    create_table :utensils do |t|
      t.references :recipe, foreign_key: true
      t.string :name
      t.boolean :completed

      t.timestamps
    end
  end
end
