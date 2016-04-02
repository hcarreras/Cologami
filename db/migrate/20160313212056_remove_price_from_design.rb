class RemovePriceFromDesign < ActiveRecord::Migration
  def change
    remove_column :designs, :price
  end
end
