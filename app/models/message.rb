class Message < ApplicationRecord
  belongs_to :user
  after_save :message_to_cable
  after_save :update_last

  def self.last_id
    last_saved = $redis.get("last_message_id")
    $redis.set("last_message_id", self.last.id) if !last_saved
    $redis.get("last_message_id")
  end

  private

  def message_to_cable
    ChatChannel.broadcast_to :main, name: user.name, time: created_at, text: text
  end

  def update_last
    $redis.set("last_message_id", Message.last.id)
  end


end
