class BroadcastNoticeJob < ApplicationJob
  queue_as :default

  def perform user, count, notification
    NoticeChannel.broadcast_to(
      user,
      count: count,
      html: NoticesController.render(partial: 'notices/notification', locals: {notification: notification}),
      notify_id: notification.id
    )
  end
end
