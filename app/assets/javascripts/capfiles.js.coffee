# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $(".recipe").on "click", (e) ->
    $('#recipe_ids').val() += $(this).attr('id')

  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $('.recipe').popover()

  $("#cap-nav a").click (e) ->
    e.preventDefault()
    $(this).tab "show"
