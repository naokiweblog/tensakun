class Api::AnswersController < ApplicationController
  def index
    room = Room.find(params[:room_id])
    last_answer_id = params[:id].to_i
    if teacher_signed_in?
      @answers = room.answers.includes(:student).where("id > ?", last_answer_id)
    elsif student_signed_in?
      @answers = room.answers.includes(:student).where(student_id: current_student.id)
    end
  end
end