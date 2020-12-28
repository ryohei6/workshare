class ChangeDataPriceToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :price, :string
  end
end
