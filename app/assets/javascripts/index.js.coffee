jQuery ->
  @topMenu = $(".navbar-top-index")
  menuItems = $("#breadcrumbs li a")

  $.each menuItems, (index, item) ->
    $(item).removeClass("active")
    $(item).on "click", (e) ->
      e.preventDefault()
      top = $($(item).attr("href")).offset().top
      $('html, body').animate(
        scrollTop: top - 35
      , 0)

  window.onScroll = () ->
    $.each menuItems, (index, item) ->
      scrollPos = $(document).scrollTop()
      refElement = $($(item).attr("href"))

      if (refElement.position().top - 100 <= scrollPos && refElement.position().top + refElement.height() - 100 > scrollPos)
        $(item).addClass("active")
      else
        $(item).removeClass("active")

  $(document).on("scroll", window.onScroll);

  $("#buy-now").click ->
    $('html, body').animate(
      scrollTop: $(".sky-item.purchase-container").offset().top
    , 0)

  $("#line_item_quantity").change ->
    quantity = $("#line_item_quantity option:selected").attr("value");
    $.ajax(url: "/shape_prices/1?quantity=#{quantity}")


  $('html, body').animate(
    scrollTop: $("#index").offset().top - 100
  , 0)
