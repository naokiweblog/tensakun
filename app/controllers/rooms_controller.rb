class RoomsController < ApplicationController
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

  private
  def room_params
    params.require(:room).permit(:name, teacher_ids: [])
  end
end
