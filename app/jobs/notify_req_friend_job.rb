class NotifyReqFriendJob < ApplicationJob
  queue_as :default

  def perform s_user, res_user, action
    case action
    when "send-req"
      ReqFriendChannel.broadcast_to(
        res_user,
        html_header: ReqFriendsController.render( partial: 'req_friends/req_friend', locals: {user: s_user, c_user: res_user}),
        html_show: ReqFriendsController.render(partial: 'req_friends/respone', locals: {user: s_user} ),
        count_req: ReqFriend.where(res_user_id: res_user, seen: false).count,
        action: "send-req" 
      )
    when "delete-req"
      ReqFriendChannel.broadcast_to(
       res_user,
       res_user_id: s_user.id,
       count_req: ReqFriend.where(res_user_id: res_user, seen: false).count,
       html_show: ReqFriendsController.render(partial: 'req_friends/add_friend', locals: {user: s_user}),
       action: "delete-req"
      )
    when "accept-friend"
      ReqFriendChannel.broadcast_to(
       res_user,
       html_show: FriendsController.render(partial: 'friends/unfriend', locals: {user: s_user}),
       action: "accept-friend"
      )

    when "unfriend"
      ReqFriendChannel.broadcast_to(
       res_user,
       html_show: ReqFriendsController.render(partial: 'req_friends/add_friend', locals: {user: s_user}),
       html_follow: FollowsController.render(partial: 'follows/unfollow', locals: {unfollower: s_user}),
       action: "unfriend"
      )
    end
  end
end
