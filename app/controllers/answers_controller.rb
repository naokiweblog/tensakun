class AnswersController < ApplicationController
  before_action :set_room
  before_action :set_answer, only: [:edit]
  before_action :move_to_top

  def index
    @answer = Answer.new
    @answers = @room.answers.includes(:student)
    if student_signed_in?
      @ans = @room.answers.includes(:student).where(student_id: current_student.id)
    end
  end

  def create
    @answer = @room.answers.new(answer_params)
    if @answer.save
      respond_to do |format|
        format.json
      end
    else
      @answers = @room.answers.includes(:student)
      render :index
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end
  def update
    @answer = Answer.find(params[:id])
    if @answer.update(upanswer_params)
    else
      render :edit
    end
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

  def move_to_top
    if student_signed_in?
    elsif teacher_signed_in?
    else
      redirect_to root_path
    end
  end
end