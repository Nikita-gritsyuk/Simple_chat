App.online = App.cable.subscriptions.create "OnlineChannel",
  connected: ->

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    update_online(data)


