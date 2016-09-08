App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    $.growl
      title: "Connected!",
      message: "connection established"
      style: "notice"
    Sounds.connection_established.play()

  disconnected: ->
    $.growl
      title: "ERROR!",
      message: "connection lost, trying to reconnect..."
      style: "error"
    Sounds.connection_lost.play()

  received: (data) ->
    console.log(data)
    show_message(data)

