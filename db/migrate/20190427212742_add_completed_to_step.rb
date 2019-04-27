class AddCompletedToStep < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :completed, :boolean
  end
end
