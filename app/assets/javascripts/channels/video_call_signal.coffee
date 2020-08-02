App.video_call_signal = App.cable.subscriptions.create "VideoCallSignalChannel",
   connected: ->
    # Called when the subscription is ready for use on the server

   disconnected: ->
    # Called when the subscription has been terminated by the server

   received: (data) ->
     switch data.type
      when "SIGNAL" then mackACall(data)
      when "CANCEL" then closeWindow()
    # Called when there's incoming data on the websocket for this channel

  closeWindow = ->
    $("#cancel-btn-id").click()
    window.opener = self
    window.close()
    return
  mackACall = (data)->
    setTimeout (->
      $("body").prepend(data.html)
      $("#signal-ringtone-reciever")[0].muted = false;
      $("#signal-ringtone-reciever")[0].play();
      return
    ), 2000
    setTimeout (->
      $("#cancel-btn-id").click()
      return
    ), 30000

