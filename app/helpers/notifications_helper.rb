module NotificationsHelper
  def notifications_result
    Activity.of_user_clubs(current_user.user_clubs.joined).oder_by_read
  end

  def option_image notification
    img =  notification.owner.avatar
    case notification.trackable_type
    when Club.name
      img =  notification.trackable.image
    when Event.name
      img =  notification.trackable.image
    when Organization.name
      img =  notification.trackable.logo
    when Image.name
      img =  notification.trackable.url
    end
    image_tag img, class: "img-responsive"
  end

  def url_notification notification
    if notification.trackable_type == Settings.notification_event
      url = club_event_path(id: notification.trackable_id, club_id: notification.container_id)
    else
      url = club_albums_path(club_id: notification.container_id)
    end
  end
end
