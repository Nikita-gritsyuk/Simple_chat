# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat:main'
    current_user.add_online_with_sockets
    OnlineChannel.broadcast_to :main, User.online
  end

  def new_message(data)
    current_user.messages.create(text: data['text'])
  end

  def unsubscribed
    current_user.remove_online_with_sockets
    OnlineChannel.broadcast_to :main, User.online
  end
end
