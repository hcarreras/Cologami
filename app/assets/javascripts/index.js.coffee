jQuery ->
  $("#line_item_quantity").change ->
    quantity = $("#line_item_quantity option:selected").attr("value");
    $.ajax(url: "/shape_prices/1?quantity=#{quantity}")

