class ClubChannel < ApplicationCable::Channel
  def subscribed
    stream_from "club_#{params['club_id']}_channel"
  end

  def unsubscribed
  end

  def speak data
    Message.create! content: data['message'], user: current_user, club_id: data['club_id']
  end
end
