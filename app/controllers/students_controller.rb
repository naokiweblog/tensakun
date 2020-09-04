class StudentsController < ApplicationController
  def index
    return nil if params[:keyword] == ""
    if teacher_signed_in?
      @students = Student.where(['name LIKE ?', "%#{params[:keyword]}%"] ).limit(10)
    elsif student_signed_in?
      @students = Student.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_student.id).limit(10)
    end
    respond_to do |format|
      format.json
    end
  end
  def show
  end
end