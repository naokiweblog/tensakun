require 'rails_helper'
require 'spec_helper'

describe Answer do
  describe '#create' do

    it "question, content,room_id, student_idがあれば登録できる" do
      answer = build(:answer, score: nil, hint: nil)
      expect(answer).to be_valid
    end

    it "questionがないと登録できない" do
      answer = build(:answer, question: nil)
      answer.valid?
      expect(answer.errors[:question]).to include("を入力してください")
    end

    it "contentがないと登録できない" do
      answer = build(:answer, content: nil)
      answer.valid?
      expect(answer.errors[:content]).to include("を入力してください")
    end

    it "room_idがないと登録できない" do
      answer = build(:answer, room_id: nil)
      answer.valid?
      expect(answer.errors[:room]).to include("を入力してください")
    end

    it "student_idがないと登録できない" do
      answer = build(:answer, student_id: nil)
      answer.valid?
      expect(answer.errors[:student]).to include("を入力してください")
    end

    it "questionが6文字以内であれば登録できる" do
      answer = build(:answer, question: "大問二の問十")
      expect(answer).to be_valid
    end

    it "passwordが7文字以上であれば登録できない" do
      answer = build(:answer, question: "大問二の問十三")
      answer.valid?
      expect(answer.errors[:question]).to include("は6文字以内で入力してください")
    end
  end
end