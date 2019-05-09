class RenameDaiariesToDiaries < ActiveRecord::Migration[5.2]
  def change
    rename_table :daiaries, :diaries
  end
end
