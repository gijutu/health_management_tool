class RemoveActionFromDayActions < ActiveRecord::Migration[5.2]
  def up
    add_column :diaries, :day_action, :boolean
  end

  def down
    remove_column :diaries, :action, :integer
  end
end
