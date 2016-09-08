module ApplicationHelper
  def current_protocol
    session['warden.user.user.protocol'] || :cable
  end
end
