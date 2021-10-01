class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast "chat_channel", message: data["message"], sent_by: data["name"]
  end

  def announce(data)
    ActionCable.server.broadcast "chat_channel", chat_room_name: data["name"], type: data["type"]
  end
end