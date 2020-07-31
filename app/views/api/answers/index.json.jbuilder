json.array! @answers do |answer|
  json.question answer.question
  json.student_name answer.student.name
  json.score answer.score
  json.content answer.content
  json.hint answer.hint
  json.id answer.id
  json.room_id answer.room.id
end