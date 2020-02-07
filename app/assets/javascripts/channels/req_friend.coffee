App.req_friend = App.cable.subscriptions.create "ReqFriendChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    switch data.action
      when "send-req" 
        $(".all-notifies").prepend(data.html_header)
        $("#ass-fr-btn").replaceWith(data.html_show)
        $(".req-count-wrap").html("<p class='p-notify req-count' >#{data.count_req}</p>")
      when "delete-req"
        $("#notify-req_#{data.res_user_id}").remove()
        $("#ass-fr-btn").replaceWith(data.html_show)
        if data.count_req > 0
          $(".req-count-wrap").html("<p class='p-notify req-count' >#{data.count_req}</p>")
        else
          $(".req-count-wrap").html("")
      when "accept-friend"
        $("#ass-fr-btn").replaceWith(data.html_show)
      when "unfriend"
        $("#ass-fr-btn").replaceWith(data.html_show)
        $("#follow-link").replaceWith(data.html_follow)

