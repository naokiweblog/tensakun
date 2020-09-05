class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
    if teacher_signed_in?
      @group.teachers << current_teacher
    elsif student_signed_in?
      @group.students << current_student
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group)
    else
      render :new
    end
  end

  def show
  end

  private
  def group_params
    params.require(:group).permit(teacher_ids: [], student_ids: [])
  end

end
