module UserEventsHelper
  def join_event? event
    current_user.user_events.find_by(event: event).present?
  end
end
