class RenameTitleUserIconColumnToDaiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :daiaries, :title, :comment
    rename_column :daiaries, :user_icon, :day_icon
  end
end
