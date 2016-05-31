jQuery ->
  $("#line_item_quantity").change ->
    quantity = $("#line_item_quantity option:selected").attr("value");
    $.ajax(url: "/shape_prices/1?quantity=#{quantity}")

  $("#buy-now").click ->
    $('html, body').animate(
      scrollTop: $(".sky-item.purchase-container").offset().top
    , 0)
