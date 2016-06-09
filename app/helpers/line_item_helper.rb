# -*- encoding : utf-8 -*-
module LineItemHelper
  def line_item_pretty_title(line_item)
    "Pack #{line_item.quantity} #{line_item.shape.title.pluralize(line_item.quantity)}"
  end
end
