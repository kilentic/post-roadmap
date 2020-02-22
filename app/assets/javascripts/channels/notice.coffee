App.notice = App.cable.subscriptions.create "NoticeChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.notify-wrapper p').html(data.count)
    $('.new-notify-wrapper').prepend(data.html)
    setTimeout (->
      $("#new-notify_" + data.notify_id).remove()
      return
    ), 5000

    # Called when there's incoming data on the websocket for this channel
