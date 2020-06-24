class RoomsController < ApplicationController
  def index
  end
  
  def new
    @room = Room.new
    @room.teacher << current_teacher
  end

  def create
    
  end
end
