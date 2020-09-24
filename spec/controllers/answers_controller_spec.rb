require 'rails_helper'

describe AnswersController do


  let(:room) { create(:room) }
  let(:teacher) { create(:teacher) }
  let(:student) { create(:student) }

  describe '#index' do
    context 'teacher log in' do
      before do
        teacher_login teacher
        get :index, params: { room_id: room.id }
      end

      it 'assigns @answer' do
        expect(assigns(:answer)).to be_a_new(Answer)
      end

      it 'assigns @room' do
        expect(assigns(:room)).to eq room
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'student log in' do
      before do
        student_login student
        get :index, params: { room_id: room.id }
      end

      it 'assigns @answer' do
        expect(assigns(:answer)).to be_a_new(Answer)
      end

      it 'assigns @room' do
        expect(assigns(:room)).to eq room
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index, params: { room_id: room.id }
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end