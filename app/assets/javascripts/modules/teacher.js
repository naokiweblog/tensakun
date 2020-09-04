$(function() {
  function appendTeacher(teacher) {
    let html = `
                <div class="NewMember">
                  <p class="NewMember__name">${teacher.name}</p>
                  <div class="NewMember__add NewMember__button" data-teacher-id="${teacher.id}" data-teacher-name="${teacher.name}">追加</div>
                </div>
                `;
    $("#UserSearchTeacher").append(html);
  }

  function addTeacher(name, id) {
    let html = `
                <div class="GroupMember">
                  <p class="GroupMember__name">${name}</p>
                  <input name="group[teacher_ids][]" type="hidden" value="${id}" />
                  <div class="GroupMember__remove GroupMember__button">削除</div>
                </div>
                `;
    $("#GroupTeachers").append(html);
  }

  $("#UserSearch").on("keyup", function() {
    let input = $("#UserSearch").val();
    $.ajax({
      type: "GET",
      url: "/teachers",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(teachers) {
      $("#UserSearchTeacher").empty();
      if (teachers.length !== 0) {
        teachers.forEach(function(teacher) {
          appendTeacher(teacher);
        });
      } else if (input.length == 0) {
        return false;
      } else {
      }
    })
    .fail(function() {
      alert("通信エラーです。講師が表示できません。");
    });
  });
  $("#UserSearchTeacher").on("click", ".NewMember__add", function() {
    const teacherName = $(this).attr("data-teacher-name");
    const teacherId = $(this).attr("data-teacher-id");
    $(this).parent().remove();
    addTeacher(teacherName, teacherId);
  });
  $("#GroupTeachers").on("click", ".GroupMember__remove", function() {
    $(this).parent().remove();
  });
});