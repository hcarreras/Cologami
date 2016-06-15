class AddPriorityToDesign < ActiveRecord::Migration
  def change
    add_column :designs, :priority, :integer, default: 0
  end
end
