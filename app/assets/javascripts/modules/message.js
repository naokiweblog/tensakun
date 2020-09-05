$(function(){
  function buildMessage(message){
    if (message.image) {
      let html = `<div class="One-message" data-message-id=${message.id}>
                    <div class="One-message__content">
                      <div class="One-message__content--value">
                        <p class="One-message__content--value--text">
                          ${message.content}
                        </p>
                      </div>
                    </div>
                    <image class="One-message__image" src="${message.image}">
                    <div class="One-message__time">
                      ${message.created_at}
                    </div>
                  </div>`
      return html
    } else {
      let html = `<div class="One-message" data-message-id=${message.id}>
                    <div class="One-message__content">
                      <div class="One-message__content--value">
                        <p class="One-message__content--value--text">
                          ${message.content}
                        </p>
                      </div>
                    </div>
                    <div class="One-message__time">
                      ${message.created_at}
                    </div>
                  </div>`
      return html
    }
  }

  $(".MessagePost").on("submit", function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr("action");
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildMessage(data);
      $(".Messages").append(html);
      $(".MessagePost__submit").prop("disabled", false);
      $(".MessagePost")[0].reset();
      $(".Messages").animate({ scrollTop: $(".Messages")[0].scrollHeight});
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $(".MessagePost__submit").prop("disabled", false);
    });
  });
});