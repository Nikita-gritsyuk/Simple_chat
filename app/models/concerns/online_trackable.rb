module OnlineTrackable
  extend ActiveSupport::Concern

  def add_online_with_sockets
    $redis.set("online_#{self.class.name}", (self.class.online_with_sockes_ids << id).to_json)
    self.class.online
  end

  def remove_online_with_sockets
    arr = self.class.online_with_sockes_ids
    arr.delete_at(arr.find_index(id))
    $redis.set("online_#{self.class.name}", arr.to_json())
    self.class.online
  end

  module ClassMethods

    def online_with_sockets
      self.where(id: self.online_with_sockes_ids)
    end

    def online_with_sockes_ids
      json = $redis.get("online_#{self.name}") || "[]"
      ActiveSupport::JSON.decode(json)
    end

    def clear_online_via_sockets
      $redis.set("online_#{self.name}", "[]")
    end

  end
end




