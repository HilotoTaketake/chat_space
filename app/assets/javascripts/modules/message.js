$(function(){
  function buildHTML(message){
    if ( message.image ) {
      let html =
        `<div class="main-chat__message-list__js" data-message-id=${message.id}>
          <div class="what-who-when">
            <div class="what-who-when__sender">
              ${message.user_name}
            </div>
            <div class="what-who-when__time">
              ${message.created_at}
            </div>
          </div>
          <div class="what-message">
            <p class="what-message__text">
              ${message.content}
            </p>
            <img class="Message__image" src="${message.image}">
          </div>
        </div>`
      return html;
    } else {
      let html =
      `<div class="main-chat__message-list__js" data-message-id=${message.id}>
        <div class="what-who-when">
          <div class="what-who-when__sender">
            ${message.user_name}
          </div>
          <div class="what-who-when__time">
            ${message.created_at}
          </div>
        </div>
        <div class="what-message">
          <p class="what-message__text">
            ${message.content}
          </p>
        </div>
      </div>`
      return html;
    };
  }

  $('.bottom-space').on('submit', function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr('action');

    $('.bottom-space__blue').removeAttr('data-disable-with');

    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.main-chat__message-list').append(html);      
      $('form')[0].reset();
      $('.main-chat__message-list').animate({ scrollTop: $('.main-chat__message-list')[0].scrollHeight});
      $('bottom-space__blue').prop("disabled", false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.bottom-space__blue').prop("disabled", false);
    });
  });
});