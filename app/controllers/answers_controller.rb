class AnswersController < ApplicationController
  before_action :set_room
  before_action :set_answer, only: [:edit]

  def index
    @answer = Answer.new
    @answers = @room.answers.includes(:student)
  end

  def create
    @answer = @room.answers.create(answer_params)
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end
  def update
    @answer = Answer.find(params[:id])
    if @answer.update(upanswer_params)
      # redirect_to room_answers_path(@room)
    else
      render :edit
    end
    # @answer = @room.answers.update(upanswer_params)
  end

  private
  def answer_params
    params.require(:answer).permit(:question, :content, :hint, :score).merge(student_id: current_student.id, room_id: params[:room_id])
  end
  def upanswer_params
    params.permit(:hint, :score)
  end
  def set_room
    @room = Room.find(params[:room_id])
  end
  def set_answer
    @answer = Answer.find(params[:id])
  end
end
