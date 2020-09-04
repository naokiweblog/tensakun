$(function() {
  function appendStudent(student) {
    let html = `
                <div class="NewMember">
                  <p class="NewMember__name">${student.name}</p>
                  <div class="NewMember__add NewMember__button" data-student-id="${student.id}" data-student-name="${student.name}">追加</div>
                </div>
                `;
    $("#UserSearchStudent").append(html);
  }

  function addStudent(name, id) {
    let html = `
                <div class="GroupMember">
                  <p class="GroupMember__name">${name}</p>
                  <input name="group[student_ids][]" type="hidden" value="${id}" />
                  <div class="GroupMember__remove GroupMember__button">削除</div>
                </div>
                `;
    $("#GroupStudents").append(html);
  }

  $("#UserSearch").on("keyup", function() {
    let input = $("#UserSearch").val();
    $.ajax({
      type: "GET",
      url: "/students",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(students) {
      $("#UserSearchStudent").empty();
      if (students.length !== 0) {
        students.forEach(function(student) {
          appendStudent(student);
        });
      } else if (input.length == 0) {
        return false;
      } else {
      }
    })
    .fail(function() {
      alert("通信エラーです。生徒が表示できません。");
    });
  });
  $("#UserSearchStudent").on("click", ".NewMember__add", function() {
    const studentName = $(this).attr("data-student-name");
    const studentId = $(this).attr("data-student-id");
    $(this).parent().remove();
    addStudent(studentName, studentId);
  });
  $("#GroupStudents").on("click", ".GroupMember__remove", function() {
    $(this).parent().remove();
  });
});