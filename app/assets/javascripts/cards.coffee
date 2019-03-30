# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready =>
  username = 'kkkkkkkkeeeekkkkk'#event.target.value
  $('#username').val(username)
  $('.sidebar-form').addClass('d-none')
  $('#message').removeAttr("disabled")
  $('#message').focus()

  updateChat = (data) ->
    $('.chat-box').append """
      <div class="col-12">
        <div class="chat bg-secondary d-inline-block text-left text-white mb-2">
          <div class="chat-bubble">
            <small class="chat-username">#{data.username}</small>
            <p class="m-0 chat-message">#{data.message}</p>
          </div>
        </div>
      </div>
    """
    return

  $('#chat-form').on 'ajax:success', (data) ->
    $('#chat-form')[0].reset()
    return

  Pusher.logToConsole = true;
  pusher = new Pusher('<%= ENV["PUSHER_KEY"] %>',
    cluster: '<%= ENV["PUSHER_CLUSTER"] %>'
    encrypted: true)
  channel = pusher.subscribe('chat')
  channel.bind 'new', (data) ->
    updateChat data
    return
  return