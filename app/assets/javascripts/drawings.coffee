# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

initiate_color_pallate = ->
  $('#colorinput').click()
  return

get_user_info = ->
  user = undefined
  params = undefined
  user = $('.user_short_profile')
  params =
    user_name: user.attr('user_name')
    user_id: user.attr('user_id')
  params

$('.square_box').click ->
  color = $('#colorinput').val()
  if color != '#f9f4f4'
    params = get_user_info()
    params.color_code = color
    params.container = $(this).attr("id")
    App.drawing_activity.drawing params
  else
    initiate_color_pallate()
  return


$('#add-new-color').on 'click', ->
  initiate_color_pallate()
  return

$(window).bind 'load', ->
  $('[data-toggle="popover"]').popover
    html: true
    placement: 'bottom'
    trigger: 'hover'
    width: '500px'
  return
