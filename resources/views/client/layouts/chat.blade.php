@extends('client.shared.master')
@section('content')

<style>
  #chat-window {
    border: 1px solid #ddd;
    width: 400px;
    margin: 50px auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  }

  #chat-header {
    background-color: #2196F3;
    color: #fff;
    padding: 10px;
    text-align: center;
  }

  #chat-body {
    background-color: #f5f5f5;
    height: 300px;
    overflow-y: scroll;
    padding: 10px;
  }

  #chat-footer {
    background-color: #eee;
    padding: 10px;
    text-align: center;
  }

  #chat-input {
    padding: 5px;
    border: 1px solid #ddd;
    width: 80%;
  }

  #chat-submit {
    padding: 5px 10px;
    border: 1px solid #ddd;
    background-color: #f5f5f5;
    cursor: pointer;
  }

  .input-container {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    align-items: center;
    padding: 12px;
    background-color: #f9f9f9;
    border-radius: 6px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  }

  #chat-prefix {
    font-size: 14px;
    font-weight: bold;
    margin-right: 12px;
  }

  #chat-input-wrapper {
    position: relative;
    flex-grow: 1;
  }

  #chat-input {
    width: 100%;
    padding-left: 12px;
    padding-right: 12px;
    border: none;
    font-size: 16px;
    font-family: inherit;
  }

  #chat-input:focus {
    outline: none;
  }

  #chat-input:read-only {
    color: transparent;
    text-shadow: 0 0 0 #333;
    user-select: none;
  }

  #chat-input::-moz-selection {
    color: transparent;
    background: transparent;
    text-shadow: none;
  }

  #chat-input::selection {
    color: transparent;
    background: transparent;
    text-shadow: none;
  }

  #chat-cursor {
    position: absolute;
    right: 0;
    bottom: 0;
    width: 2px;
    height: 20px;
    background-color: #333;
    animation: cursor 1s infinite;
  }

  @keyframes cursor {

    from,
    to {
      opacity: 0;
    }

    50% {
      opacity: 1;
    }
  }
</style>

<div id="chat-window">
  <div id="chat-header">
    <h2>Chatbot</h2>
  </div>
  <div id="chat-body">
    <div id="message-area"></div>
  </div>
  <div id="chat-footer">
    <form id="chat-form">
      @csrf
      <div class="input-container">
        <div id="chat-prefix">Tôi muốn tìm một cuốn sách về</div>
        <div id="chat-input-wrapper">
          <input type="text" id="chat-input" placeholder="Nhập mô tả sách...">
        </div>
      </div>


      <button type="submit" id="chat-submit">Send</button>
    </form>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
  $(document).ready(function() {
    $('#chat-form').submit(function(event) {
      // Prevent the form from submitting normally
      event.preventDefault();

      // Get the message from the input field
      var message = $('#chat-input').val();

      // Get the CSRF token from the meta tag
      var csrfToken = $('meta[name="csrf-token"]').attr('content');

      // Send an AJAX POST request to the chat endpoint with the message and CSRF token
      $.ajax({
          method: 'POST',
          url: '/chat',
          data: {
            message: message,
            _token: csrfToken
          }
        })
        .done(function(response) {
          // Update the chat window with the response from the server
          var chatWindow = $('#chat-window');
          chatWindow.find('#message-area').append('<p><strong>You:</strong> ' + message + '</p>');
          chatWindow.find('#message-area').append('<p><strong>Bot:</strong> ' + response.message + '</p>');

          // Clear the input field
          $('#chat-input').val('');

          // Scroll to the bottom of the chat window
          chatWindow.find('#chat-body').scrollTop(chatWindow.find('#chat-body').prop('scrollHeight'));
        })
        .fail(function() {
          alert('There was an error communicating with the server.');
        });
    });
  });
</script>

@endsection