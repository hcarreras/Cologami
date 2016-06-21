jQuery ->
  class index
    $(document).on("scroll", @onScroll);

    $("#line_item_quantity").change ->
      quantity = $("#line_item_quantity option:selected").attr("value");
      $.ajax(url: "/shape_prices/1?quantity=#{quantity}")

    $("#buy-now").click ->
      $('html, body').animate(
        scrollTop: $(".sky-item.purchase-container").offset().top
      , 0)

    $("#menu-init").click ->
      $('html, body').animate(
        scrollTop: $(".header-item.purchase-container").offset().top - 35
      , 0)

    $("#menu-what-is-it").click ->
      $('html, body').animate(
        scrollTop: $(".instructions-item").offset().top - 40
      , 0)

    $("#menu-meet-our-heroes").click ->
      $('html, body').animate(
        scrollTop: $("#cranes").offset().top - 35
      , 0)

    $("#menu-buy-now").click ->
      $('html, body').animate(
        scrollTop: $(".sky-item.purchase-container").offset().top
      , 0)

    @onScroll: () =>
      alert("hello")
      console.log "Scrolleando la siudad"