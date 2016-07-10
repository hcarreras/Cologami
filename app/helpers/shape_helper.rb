module ShapeHelper
  def collection_select_for(shape)
    [
      ["Pack 5 #{shape.title.pluralize}", 5],
      ["Pack 10 #{shape.title.pluralize}", 10],
      ["Pack 20 #{shape.title.pluralize}", 20],
      ["Pack 50 #{shape.title.pluralize}", 50],
      ["Pack 100 #{shape.title.pluralize}", 100],
      ["Pack 500 #{shape.title.pluralize}", 500],
      ["Pack 1000 #{shape.title.pluralize}", 1000],
      ["Otras cantidades", "other_quantity"]
    ]
  end
end

