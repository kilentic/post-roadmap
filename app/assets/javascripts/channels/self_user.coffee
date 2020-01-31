App.self_user = App.cable.subscriptions.create "SelfUserChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#comment-post_#{data.post_id}").prepend(data.html)
    $("#post_#{data.post_id} .comment-count").html(data.count)
    # Called when there's incoming data on the websocket for this channel
