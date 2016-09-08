pool = ->
  $.ajax
    url: '/messages'
    success: (data) ->
      pool(data)
      show_messages(data)
    dataType: 'json'
    error: (data) ->
      pool(data)
  return
$ ->
  pool()
$ ->
  setInterval( ->
    $.ajax
      url: '/online'
      success: (data) ->
        update_online(data)
        dataType: 'json'
  ,1000)
@send_message = (message)->
  $.post
    url: '/messages'
    data:
      text:
        message
    dataType: 'json'

