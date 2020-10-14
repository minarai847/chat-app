require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    it "nameの値が存在すれば登録できること" do
      #条件を満たしている時の文章
      expect(@room).to be_valid
    end

    it "nameが空では登録できないこと" do
      #空というのはnilになり、@インスタンス.項目= nil(空)
      @room.name = nil
      #↑の時どう処理するか聞いている
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end
end