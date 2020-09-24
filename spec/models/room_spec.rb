require 'rails_helper'

describe Room do
  describe '#create' do

    it "nameがあれば登録できる" do
      room = build(:room)
      expect(room).to be_valid
    end

    it "nameがないと登録できない" do
      room = build(:room, name: nil)
      room.valid?
      expect(room.errors[:name]).to include("を入力してください")
    end

    it "重複したnameが存在する場合登録できない" do
      room = create(:room)
      another_room = build(:room, name: room.name)
      another_room.valid?
      expect(another_room.errors[:name]).to include("はすでに存在します")
    end

    it "nameが8文字以内であれば登録できる" do
      room = build(:room, name: "六年正月特別特訓")
      expect(room).to be_valid
    end

    it "nameが9文字以上であれば登録できない" do
      room = build(:room, name: "六年正月特別特訓改")
      room.valid?
      expect(room.errors[:name]).to include("は8文字以内で入力してください")
    end
  end
end