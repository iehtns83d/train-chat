$(function(){
  var buildHTML = function(message) {
    if (message.content && message.image) {
      //data-idが反映されるようにしている
      var html = `<div class="chat__message-list__message" data-message-id="${message.id}">
                    <div class="chat__message-list__message__inline">
                      <div class="chat__message-list__message__inline__upper">
                        <div class="chat__message-list__message__inline__upper__user-name">
                          ${message.user_name} 
                        </div>
                        <div class="chat__message-list__message__inline__upper__date">
                          ${message.created_at}
                        </div>
                      </div>
                      <div class="chat__message-list__message__inline__lower">
                        <p class="chat__message-list__message__inline__lower__content">
                          ${message.content}
                        </p>
                        <img src="${message.image}" class="lower-message__image" >
                      </div>
                    </div>
                  </div>`;
    } else if (message.content) {
      //同様に、data-idが反映されるようにしている
      var html = `<div class="chat__message-list__message" data-message-id="${message.id}">
                    <div class="chat__message-list__message__inline">
                      <div class="chat__message-list__message__inline__upper">
                        <div class="chat__message-list__message__inline__upper__user-name">
                          ${message.user_name} 
                        </div>
                        <div class="chat__message-list__message__inline__upper__date">
                          ${message.created_at}
                        </div>
                      </div>
                      <div class="chat__message-list__message__inline__lower">
                        <p class="chat__message-list__message__inline__lower__content">
                          ${message.content}
                        </p>
                      </div>
                    </div>
                  </div>`;
    } else if (message.image) {
      //同様に、data-idが反映されるようにしている
      var html = `<div class="chat__message-list__message" data-message-id="${message.id}">
                    <div class="chat__message-list__message__inline">
                      <div class="chat__message-list__message__inline__upper">
                        <div class="chat__message-list__message__inline__upper__user-name">
                          ${message.user_name} 
                        </div>
                        <div class="chat__message-list__message__inline__upper__date">
                          ${message.created_at}
                        </div>
                      </div>
                      <div class="chat__message-list__message__inline__lower">
                        <img src="${message.image}" class="lower-message__image" >
                      </div>
                    </div>
                  </div>`;
    };
    return html;
  };
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat__message-list').append(html);
      $('form')[0].reset();
      $('.chat__message-list').animate({ scrollTop: $('.chat__message-list')[0].scrollHeight});   
      $('.submit-btn').prop('disabled', false);   
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.submit-btn').prop('disabled', false);   
    });
  });
  
  var reloadMessages = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    var last_message_id = $('.chat__message-list__message:last').data("message-id");
    $.ajax({
      //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
      url: "api/messages",
      //ルーティングで設定した通りhttpメソッドをgetに指定
      type: 'get',
      dataType: 'json',
      //dataオプションでリクエストに値を含める
      data: {id: last_message_id}
    })
    .done(function(messages) {
      if (messages.length !== 0) {
        //追加するHTMLの入れ物を作る
        var insertHTML = '';
        //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
        $.each(messages, function(i, message) {
          insertHTML += buildHTML(message)
        });
        //メッセージが入ったHTMLに、入れ物ごと追加
        $('.chat__message-list').append(insertHTML);
        $('.chat__message-list').animate({ scrollTop: $('.chat__message-list')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert("error");
    });
  };
  if (document.location.href.match(/\/lines\/\d+\/stations\/\d+\/messages/)) {
    setInterval(reloadMessages, 7000);
  }
});