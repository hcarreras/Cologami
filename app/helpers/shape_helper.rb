module ShapeHelper
  def collection_select_for(shape)
    [
      ["Pack 5 #{shape.title.pluralize}", 5],
      ["Pack 10 #{shape.title.pluralize}", 10],
      ["Pack 20 #{shape.title.pluralize}", 20],
      ["Otras cantidades", "other_quantity"]
    ]
  end
end

