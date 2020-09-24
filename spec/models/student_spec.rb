require 'rails_helper'
require 'devise'

describe Student do
  describe '#create' do

    it "name, email, password, password_confirmationが全てあれば登録できる" do
      student = build(:student)
      expect(student).to be_valid
    end

    it "nameがないと登録できない" do
      student = build(:student, name: nil)
      student.valid?
      expect(student.errors[:name]).to include("を入力してください")
    end

    it "emailがないと登録できない" do
      student = build(:student, email: nil)
      student.valid?
      expect(student.errors[:email]).to include("を入力してください")
    end

    it "passwordがないと登録できない" do
      student = build(:student, password: nil)
      student.valid?
      expect(student.errors[:password]).to include("を入力してください")
    end

    it "passwordがあってもpassword_confirmationがないと登録できない" do
      student = build(:student, password_confirmation: "")
      student.valid?
      expect(student.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "重複したemailが存在する場合登録できない" do
      student = create(:student)
      another_student = build(:student, email: student.email)
      another_student.valid?
      expect(another_student.errors[:email]).to include("はすでに存在します")
    end

    it "重複したnameが存在する場合登録できない" do
      student = create(:student)
      another_student = build(:student, email: student.name)
      another_student.valid?
      expect(another_student.errors[:name]).to include("はすでに存在します")
    end

    it "passwordが6文字以上であれば登録できる" do
      student = build(:student, password: "000000", password_confirmation: "000000")
      expect(student).to be_valid
    end

    it "passwordが5文字以下であれば登録できない" do
      student = build(:student, password: "00000", password_confirmation: "00000")
      student.valid?
      expect(student.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end