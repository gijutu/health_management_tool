class AddSleepToDaiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :daiaries, :sleep_label, :string
    add_column :daiaries, :tatal_sleep, :integer
  end
end
