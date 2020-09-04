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
    if @group.save && teacher_signed_in?
      redirect_to teacher_path(current_teacher.id)
    elsif @group.save && student_signed_in?
      redirect_to student_path(current_student.id)
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
