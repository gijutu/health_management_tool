class AddCategoriesToWorseConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :worse_conditions, :category, :integer
  end
end
