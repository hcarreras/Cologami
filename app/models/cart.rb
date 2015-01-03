class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def add_design(design_id)
    current_item = line_items.find_by(design_id: design_id)
    unless current_item
      current_item = LineItem.new(design_id: design_id)
      line_items << current_item
    end
    current_item
  end
end
