jQuery ->
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  console.log('Running!')

  $('#cart').popover({
    html: true
    placement: 'bottom'
    title: () ->
      return $('#cart-template').find('.title').html()
    content: () ->
      return $('#cart-template').find('.content').html()
  })