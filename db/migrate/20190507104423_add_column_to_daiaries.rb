class AddColumnToDaiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :daiaries, :user_icon, :string
  end
end
