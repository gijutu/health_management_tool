class AddDiaryIdToFeelings < ActiveRecord::Migration[5.2]
  def change
    add_column :feelings, :diary_id, :integer
  end
end
