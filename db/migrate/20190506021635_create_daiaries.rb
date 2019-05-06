class CreateDaiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :daiaries do |t|
      t.string :title
      t.datetime :start_time

      t.timestamps
    end
  end
end
