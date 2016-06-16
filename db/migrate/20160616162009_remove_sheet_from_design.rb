class RemoveSheetFromDesign < ActiveRecord::Migration
  def change
    remove_column :designs, :sheet, :string
  end
end
