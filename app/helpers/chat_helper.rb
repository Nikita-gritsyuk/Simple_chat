module ChatHelper

  def new_messages
    session['chat.user.last_message_id'] ||= Message.last_id.to_i
    new_messages = Message.where("id > ?", last_seen_message_id)
    session['chat.user.last_message_id'] = new_messages.last.id if new_messages.last
      new_messages
  end

  def new_messages?
    session['chat.user.last_message_id'] ||= Message.last_id.to_i
    session['chat.user.last_message_id'].to_i < Message.last_id.to_i
  end

  def last_seen_message_id
    session['chat.user.last_message_id'] || Message.maximum(:id)
  end

end
