class ChatController < ApplicationController

  def index

  end

  def online
    render json: User.online
  end

  def send_message
    render json: current_user.messages.create(text: params["text"])
  end

  def messages
    if helpers.current_protocol == "long_pool"
      30.times do
        sleep 5
        break if helpers.new_messages?
      end
    end
    render :json =>helpers.new_messages.map{|m| {name: m.user.name, time: m.created_at, text: m.text}}
  end
end
