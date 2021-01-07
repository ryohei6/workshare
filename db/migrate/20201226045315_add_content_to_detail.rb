class AddContentToDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :detail, :text
  end
end
