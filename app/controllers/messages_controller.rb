class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:teacher, :student)
  end
  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messages.includes(:teacher, :student)
      render :index
    end
  end

  private
  def message_params
    if teacher_signed_in?
      params.require(:message).permit(:content, :image).merge(teacher_id: current_teacher.id)
    elsif student_signed_in?
      params.require(:message).permit(:content, :image).merge(student_id: current_student.id)
    end
  end
  def set_group
    @group = Group.find(params[:group_id])
  end
end