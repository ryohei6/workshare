class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.integer :user_id
      t.string :user_name

      t.timestamps
    end
  end
end
