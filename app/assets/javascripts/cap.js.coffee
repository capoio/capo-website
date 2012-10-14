$(document).ready (e) ->
  $(".recipe").on "click", (e) ->
    checkbox = $(this).children('#check_'+$(this).attr('id'))
    checkbox.attr('checked', !checkbox.attr('checked'))
