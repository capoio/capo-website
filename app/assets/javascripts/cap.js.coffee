$(document).ready (e) ->
  $('.recipe_check_box').hide()
  $(".recipe:not(.default)").on "click", (e) ->
    checkbox = $(this).children('#check_'+$(this).attr('id'))
    checkbox.attr('checked', !checkbox.attr('checked'))
    $(this).toggleClass('selected')
