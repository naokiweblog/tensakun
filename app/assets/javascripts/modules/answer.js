$(function(){
  function newBuildHTML(answer){
    let html = `<div class="Answers__one">
                  <div class="Answers__one--info">
                    <div class="Answers__one--info--question">
                      <p>問</p>
                      ${answer.question}
                    </div>
                    <div class="Answers__one--info--name">
                      ${answer.student_name}
                    </div>
                    <div class="Answers__one--info--score" id="score${answer.id}">
                      <p class="Answers__one--info--score--num">${answer.score}</p>
                      <p>点</p>
                    </div>
                  </div>
                  <div class="Answers__one--content">
                    ${answer.content}
                  </div>
                  <div class="Answers__one--hint">
                    ${answer.hint}
                  </div>
                  <div class="Answers__one--box">
                  </div>
                </div>`
    return html
  }

  $(".Answer").on("submit", function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr("action");
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = newBuildHTML(data);
      $("#student-answers").append(html);
      $(".Answer__info--submit").prop("disabled", false);
      $(".Answer")[0].reset();
      $("#student-answers").animate({ scrollTop: $("#student-answers")[0].scrollHeight});
    })
    .fail(function() {
      alert("(送信エラー)問題番号や答案は記入しましたか？");
      $(".Answer__info--submit").prop("disabled", false);
    });
  });
});