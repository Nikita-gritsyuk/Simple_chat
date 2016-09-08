# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@Sounds =
  new_message: new Audio('/new_message.mp3')
  connection_lost: new Audio('/connection_lost.wav')
  connection_established: new Audio('/connection_established.wav')

@show_messages = (data) ->
  $.each data, (i,message) ->
    show_message(message)

@show_message = (message) ->
  msg_wrap = $(".msg-wrap");
  tpl = _.template($("#templates > .media.msg")[0].outerHTML);
  console.log message
  html=tpl(message)
  $(html).appendTo(msg_wrap).show(100);
  msg_wrap.animate({scrollTop: msg_wrap[0].scrollHeight}, 100);
  Sounds.new_message.play()

@submit_message = () ->
  send_message($("#new_message_textarea").val())
  $("#new_message_textarea").val("")

@update_online = (data) ->
  online_list = $(".online-panel > ul")
  online_list[0].innerHTML=""
  $.each data, (data, user) ->
    $("<li>"+user.name+"</li>").appendTo(online_list)

$ ->
  $("#new_message_btn").click ->
    submit_message()


  $('#new_message_textarea').keydown (e) ->
    if e.ctrlKey and e.keyCode == 13
      submit_message()
