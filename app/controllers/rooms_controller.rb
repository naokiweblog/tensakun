class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
    @room.teachers << current_teacher
  end

  def create
    
  end
end
