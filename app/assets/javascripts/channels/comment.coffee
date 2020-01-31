App.comment = App.cable.subscriptions.create "CommentChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    @perform 'speak',{comment: data.comment, post_id: data.post_id, count: data.count}

    # Called when there's incoming data on the websocket for this channel
