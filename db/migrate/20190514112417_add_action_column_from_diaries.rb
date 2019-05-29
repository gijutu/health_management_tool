class AddActionColumnFromDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :action, :integer
  end
end
