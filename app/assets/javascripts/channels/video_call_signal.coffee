App.video_call_signal = App.cable.subscriptions.create "VideoCallSignalChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("body").prepend(data.html)
    # Called when there's incoming data on the websocket for this channel
