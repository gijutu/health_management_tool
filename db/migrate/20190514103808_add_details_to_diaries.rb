class AddDetailsToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :halfway_awakening, :boolean, default: false
    add_column :diaries, :day_action, :boolean, default: false
  end
end
