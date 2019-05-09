class RenameTatalSleepColumnToDaiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :daiaries, :tatal_sleep, :sleep_hour
  end
end
