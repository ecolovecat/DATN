<div class="openai-chat">
  <div class="openai-logo">
    <img src="https://yt3.googleusercontent.com/UqT_vCkJIn1P2fH1pchr6lbe3xeEekY61h4bUpJkVuityqKOEtUYcNy3pLiJ5OKdj4uKA81FWE8=s900-c-k-c0x00ffffff-no-rj" height="50px" width="50px" alt="OpenAI Logo" onclick="openChatWindow()">
  </div>
  <div class="chat-window">
    <div id="chat-header">
      <h2>Tư vấn sách</h2>
      <i id="close-chat" class="material-icons">close</i>
    </div>
    <div class="chat-container">
      @if(Auth::check())
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


          <button type="submit" id="chat-submit">Gửi</button>
        </form>
      </div>
      @else
      <div class="login-require">
        <p class="login-require--text">Bạn phải đăng nhập để sử dụng chức năng này</p>
        <a href="{{ url('/login') }}">Đăng nhập</a>
      </div>

      @endif

    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  const chatWindow = document.querySelector('.chat-window');
  const openButton = document.querySelector('.openai-logo img');
  const closeButton = document.querySelector('#close-chat');

  closeButton.addEventListener('click', () => {
    chatWindow.style.display = 'none';
    openButton.style.display = 'block';
  });

  // Show/hide chat window
  openButton.addEventListener('click', () => {
    chatWindow.style.display = 'block';
    openButton.style.display = 'none';
  });
</script>
<script>
  $(document).ready(function() {
    $('#chat-form').submit(function(event) {
      // Prevent the form from submitting normally
      event.preventDefault();

      // Get the message from the input field
      var message = $('#chat-input').val();
      var chatWindow = $('.chat-window');
      chatWindow.find('#message-area').append('<p><strong>You:</strong> Tôi muốn tìm một cuốn sách về ' + message + '</p>');
      chatWindow.find('#message-area').append('<p id="typing-message"><strong>2handbook:</strong> typing<span id="typing-dots"></span></p>');
      chatWindow.find('#chat-body').scrollTop(chatWindow.find('#chat-body').prop('scrollHeight'));

      var dots = 0;
      var typingInterval = setInterval(function() {
        dots = (dots + 1) % 4;
        var dotsString = Array(dots + 1).join('.');
        $('#typing-dots').text(dotsString);
      }, 500);

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
          clearInterval(typingInterval);
          // Update the chat window with the response from the server
          var chatWindow = $('.chat-window');
          $('#typing-message').remove();
          chatWindow.find('#message-area').append('<p><strong>2handbook:</strong> ' + response.message + '</p>');

          // Clear the input field
          $('#chat-input').val('');

          // Scroll to the bottom of the chat window
          chatWindow.find('#chat-body').scrollTop(chatWindow.find('#chat-body').prop('scrollHeight'));
        })
        .fail(function() {
          clearInterval(typingInterval);
          alert('There was an error communicating with the server.');
        });
    });
  });
</script>