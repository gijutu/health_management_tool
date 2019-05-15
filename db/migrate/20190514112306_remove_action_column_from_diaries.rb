class RemoveActionColumnFromDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :day_action, :boolean
  end
end
