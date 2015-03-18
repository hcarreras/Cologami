class AddSheetToDesign < ActiveRecord::Migration
  def change
    add_column :designs, :sheet, :string
  end
end
