App.req_friend = App.cable.subscriptions.create "ReqFriendChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    switch data.action
      when 1
        $(".all-notifies").prepend(data.html_header)
        $("#ass-fr-btn").html(data.html_show)
        $(".req-count-wrap").html("<p class='p-notify req-count' >#{data.count_req}</p>")
      when 0
        $("#notify-req_#{data.res_user_id}").remove()
        $("#ass-fr-btn").html(data.html_show)
        if data.count_req > 0
          $(".req-count-wrap").html("<p class='p-notify req-count' >#{data.count_req}</p>")
        else
          $(".req-count-wrap").html("")

