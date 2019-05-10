class AddSleepsToDaiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :daiaries, :getup_at, :time
    add_column :daiaries, :sleep_at, :time
  end
end
