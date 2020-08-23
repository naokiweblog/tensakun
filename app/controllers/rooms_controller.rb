class RoomsController < ApplicationController
  before_action :move_to_top

  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
    @room.teachers << current_teacher
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      @room = Room.new
      @room.teachers << current_teacher
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, teacher_ids: [])
  end

  def move_to_top
    if student_signed_in?
    elsif teacher_signed_in?
    else
      redirect_to root_path
    end
  end
end
