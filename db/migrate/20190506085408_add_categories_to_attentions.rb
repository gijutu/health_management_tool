class AddCategoriesToAttentions < ActiveRecord::Migration[5.2]
  def change
    add_column :attentions, :category, :integer
  end
end
