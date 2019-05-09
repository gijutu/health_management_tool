class ChangeDatatypeSleepHourOfDaiaries < ActiveRecord::Migration[5.2]
  def change
    change_column :daiaries, :sleep_hour, :float
  end
end
