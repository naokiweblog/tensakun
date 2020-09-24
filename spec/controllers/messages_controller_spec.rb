require 'rails_helper'

describe MessagesController do


  let(:group) { create(:group) }
  let(:teacher) { create(:teacher) }
  let(:student) { create(:student) }

  describe '#index' do
    context 'teacher log in' do
      before do
        teacher_login teacher
        get :index, params: { group_id: group.id }
      end

      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'student log in' do
      before do
        student_login student
        get :index, params: { group_id: group.id }
      end

      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index, params: { group_id: group.id }
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end