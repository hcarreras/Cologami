class LineItemBelongsToShape < ActiveRecord::Migration
  def change
    rename_column :line_items, :design_id, :shape_id
  end
end
