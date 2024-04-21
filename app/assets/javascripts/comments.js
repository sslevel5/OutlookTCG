$(document).ready(function() {
  // コメントフォームの送信を非同期で処理する
  $('#new_comment_form').on('submit', function(e) {
    e.preventDefault();
    var formData = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: formData,
      success: function(response) {
        $('#messages').append(response);
        $('#comment_message').val(''); // コメント入力欄をクリアする
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  });
});
