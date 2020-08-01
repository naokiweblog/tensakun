$(function(){
  function buildHTML(answer){
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
                      ${answer.score}
                      <p>点</p>
                    </div>
                  </div>
                  <div class="Answers__one--content">
                    ${answer.content}
                  </div>
                  <div class="Answers__one--form" id="${answer.id}">
                    <div class="Answers__one--form--hint">
                      ${answer.hint}
                    </div>
                    <a class="Answers__one--form--edit" data-remote="true" href="/rooms/${answer.room_id}/answers/${answer.id}/edit">採点する</a>
                  </div>
                  <div class="Answers__one--box">
                  </div>
                </div>`
    return html
  }

  function studentBuildHTML(answer){
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

  let reloadAnswers = function() {
    let last_answer_id = $('.Answers__one:last').data("answer-id") || 0;
    $.ajax({
      url: "api/answers",
      type: 'get',
      dataType: 'json',
      data: {id: last_answer_id}
    })
    .done(function(answers) {
      if (answers.length !== 0) {
        let insertHTML = "";
        $.each(answers, function(i, answer) {
          insertHTML += buildHTML(answer)
        });
        $("#teacher-answers").append(insertHTML);
      }
      let studentInsertHTML = "";
      $.each(answers, function(i, answer) {
        studentInsertHTML += studentBuildHTML(answer)
      });
      $("#student-answers").html(studentInsertHTML);
    })
    .fail(function() {
      alert('error');
    });
  };
  $(function() {
      setInterval(reloadAnswers, 10000);
  });
})