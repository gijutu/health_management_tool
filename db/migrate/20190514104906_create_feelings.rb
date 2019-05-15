class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.string :morning_feel
      t.string :noon_feel
      t.string :night_feel

      t.timestamps
    end
  end
end
