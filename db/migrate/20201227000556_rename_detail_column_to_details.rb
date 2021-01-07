class RenameDetailColumnToDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :details, :detail, :comment
  end
end
