class CreateAttentions < ActiveRecord::Migration[5.2]
  def change
    create_table :attentions do |t|
      t.string :content

      t.timestamps
    end
  end
end
