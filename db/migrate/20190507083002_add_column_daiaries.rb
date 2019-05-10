class AddColumnDaiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :daiaries, :user_id, :bigint
  end
end
