# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.dialect-img').click ->
    $('.selected').removeClass 'selected'
    $(this).addClass 'selected'
    return

  $('.dialect-img').first().addClass 'selected'


  $('#new_user').submit (event) ->
    selected_dialect = $('.selected').data('id')
    $('#user_dialect_id').val selected_dialect
    return
