require 'rails_helper'
require 'spec_helper'

describe Message do
  describe '#create' do
    context 'can save' do
      it "contentがあれば登録できる" do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end

      it "imageがあれば登録できる" do
        message = build(:message, content: nil)
        expect(message).to be_valid
      end

      it "contentとimageがあれば登録できる" do
        message = build(:message)
        expect(message).to be_valid
      end

      it "student_idがなくても登録できる" do
        message = build(:message, student_id: nil)
        expect(message).to be_valid
      end

      it "teacher_idがなくても登録できる" do
        message = build(:message, teacher_id: nil)
        expect(message).to be_valid
      end
    end

    context 'can not save' do
      it "contentとimageがないと登録できない" do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it "group_idがないと登録できない" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end
    end
  end
end