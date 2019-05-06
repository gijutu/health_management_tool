class CreateBetterConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :better_conditions do |t|
      t.string :content

      t.timestamps
    end
  end
end
