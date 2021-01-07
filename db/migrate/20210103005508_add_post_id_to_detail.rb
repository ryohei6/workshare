class AddPostIdToDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :post_id, :integer
  end
end
