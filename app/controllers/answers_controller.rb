class AnswersController < ApplicationController
  before_action :set_room

  def index
    @answer = Answer.new
    @answers = @room.answers.includes(:student)
  end
  def create
    @answer = @room.answers.create(answer_params)
  end

  private
  def answer_params
    params.require(:answer).permit(:question, :content, :hint, :score).merge(student_id: current_student.id, room_id: params[:room_id])
  end
  def set_room
    @room = Room.find(params[:room_id])
  end
end
