require 'rails_helper'
require 'devise'

describe Teacher do
  describe '#create' do

    it "name, email, password, password_confirmationが全てあれば登録できる" do
      teacher = build(:teacher)
      expect(teacher).to be_valid
    end

    it "nameがないと登録できない" do
      teacher = build(:teacher, name: nil)
      teacher.valid?
      expect(teacher.errors[:name]).to include("を入力してください")
    end

    it "emailがないと登録できない" do
      teacher = build(:teacher, email: nil)
      teacher.valid?
      expect(teacher.errors[:email]).to include("を入力してください")
    end

    it "passwordがないと登録できない" do
      teacher = build(:teacher, password: nil)
      teacher.valid?
      expect(teacher.errors[:password]).to include("を入力してください")
    end

    it "passwordがあってもpassword_confirmationがないと登録できない" do
      teacher = build(:teacher, password_confirmation: "")
      teacher.valid?
      expect(teacher.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "重複したemailが存在する場合登録できない" do
      teacher = create(:teacher)
      another_teacher = build(:teacher, email: teacher.email)
      another_teacher.valid?
      expect(another_teacher.errors[:email]).to include("はすでに存在します")
    end

    it "重複したnameが存在する場合登録できない" do
      teacher = create(:teacher)
      another_teacher = build(:teacher, email: teacher.name)
      another_teacher.valid?
      expect(another_teacher.errors[:name]).to include("はすでに存在します")
    end

    it "passwordが6文字以上であれば登録できる" do
      teacher = build(:teacher, password: "000000", password_confirmation: "000000")
      expect(teacher).to be_valid
    end

    it "passwordが5文字以下であれば登録できない" do
      teacher = build(:teacher, password: "00000", password_confirmation: "00000")
      teacher.valid?
      expect(teacher.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end