App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if $(".room_" + data.room_id).length == 0  
      $.ajax "/rooms/#{data.room_id}",
        type: 'GET'
        dataType: 'script'
    else
      $(".room_#{data.room_id} .chat-messages-wrap").append(data.html_message);
      $(".room_#{data.room_id} .chat-messages-wrap").animate({ scrollTop:$(".room_#{data.room_id} .chat-messages-wrap")[0].scrollHeight }, 1000);

      if $(".room-icon_#{data.room_id}").hasClass('show')
        $(".room-icon_#{data.room_id}").parent().find('p').addClass('show')
    # Called when there's incoming data on the websocket for this channel
