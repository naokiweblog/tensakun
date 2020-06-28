class AnswersController < ApplicationController
  before_action :set_room

  def index
    @answers = Answer.all
  end
  def create
    @answer = @room.answers.new(answer_params)
  end

  private
  def answer_params
    
    params.require(:answer).permit(:question, :content, :hint, :score).merge(student_id: current_student.id)
  end
  def set_room
    @room = Room.find(params[:room_id])
  end
end
