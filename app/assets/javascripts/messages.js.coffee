# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
PrivatePub.subscribe "/messages/new", (data, channel) ->
  console.log data.message.content

PrivatePub.subscribe "/app/publish_users", (data, channel) ->
  console.log data

setTimeout (->
  $('.publish-form').submit()
  return
), 1000

$ ->
  $(".publish-form").submit (e) ->
    action_url = $('.publish-form').attr('action')
    $('.publish-form').attr('action',"#{action_url}?user_action=connected")

  $("#logout_link").click (e) ->
    action_url = $('.publish-form').attr('action')
    $('.publish-form').attr('action',"#{action_url}?user_action=disconnected")
    $('.publish-form').submit()
