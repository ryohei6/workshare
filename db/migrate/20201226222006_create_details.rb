class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    drop_table :details
    create_table :details do |t|
      t.text :detail

      t.timestamps
    end
  end
end
