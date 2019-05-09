class RenameAndRetypeColumnsOfDiaries < ActiveRecord::Migration[5.2]
  def up
    add_column :diaries, :sleep_at, :datetime
    add_column :diaries, :getup_at, :datetime
    remove_column :diaries, :sleep_at
    remove_column :diaries, :getup_at
  end

  def down
    remove_column :diaries, :sleep_at, :datetime
    remove_column :diaries, :getup_at, :datetime
    add_column :diaries, :sleep_at, :time
    add_column :diaries, :getup_at, :time
  end
end
