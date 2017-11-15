App.drawing_activity = App.cable.subscriptions.create "DrawingActivityChannel",
  connected: ->

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    container = data["drawing"]
    square_box = $("#"+container["drawing_area"])
    meta_data ="<h5>User: <b>"+data["meta_data"]+"</b></h5><p>Draw at: <b>"+container["updated_at"]+"</b></p><p>Color code: <b>"+container["color_code"]+"</b</p>"
    $(".leader_board_section").html(data["leader_board"])
    square_box.css 'background-color', container["color_code"]
    square_box.attr 'data-content', meta_data

  drawing: (params) ->
    @perform 'drawing', color_code: params.color_code, user_id: params.user_id, container: params.container, user_name: params.user_name
