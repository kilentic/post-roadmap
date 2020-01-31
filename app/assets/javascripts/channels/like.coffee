App.like = App.cable.subscriptions.create "LikeChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#like_#{data.duty_type}_#{data.duty_id} .like-count").html(data.count)
    # Called when there's incoming data on the websocket for this channel
