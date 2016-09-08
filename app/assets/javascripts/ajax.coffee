$ ->
  setInterval( ->
    $.ajax
      url: '/messages'
      success: (data) ->
        show_messages(data)
        console.log data
      dataType: 'json'
  ,1000)

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

