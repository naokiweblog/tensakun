class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
    @room.teachers << current_teacher
  end

  def create
    Room.create(room_params)
    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:name, teacher_ids: [])
  end
end
