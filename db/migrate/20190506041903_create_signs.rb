class CreateSigns < ActiveRecord::Migration[5.2]
  def change
    create_table :signs do |t|
      t.date :weekly_sign
      t.bigint :better_condition_id
      t.bigint :attention_id
      t.bigint :worse_condition_id

      t.timestamps
    end
  end
end
