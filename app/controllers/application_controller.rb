class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  after_filter :user_activity

  private

  def user_activity
    current_user.try :touch
    OnlineChannel.broadcast_to :main, User.online
  end
end
