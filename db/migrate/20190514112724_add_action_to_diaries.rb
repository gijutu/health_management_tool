class AddActionToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :day_action, :integer
  end
end
