class AddSleepsToDaiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :daiaries, :get_up_time, :time
    add_column :daiaries, :bed_time, :time
  end
end
