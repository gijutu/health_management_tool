class AddCategoriesToBetterConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :better_conditions, :category, :integer
  end
end
