class TeachersController < ApplicationController
  def index
    return nil if params[:keyword] == ""
    if teacher_signed_in?
      @teachers = Teacher.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_teacher.id).limit(10)
    elsif student_signed_in?
      @teachers = Teacher.where(['name LIKE ?', "%#{params[:keyword]}%"] ).limit(10)
    end
    respond_to do |format|
      format.json
    end
  end
  def show
    @teacher = Teacher.find(params[:id])
  end
end