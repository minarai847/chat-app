require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      #expect(↑のインスタンス).to be_valid
      #user新規登録時に必要な項目（名前、メールアドレス、パスワード）の条件を満たしているか
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      #@インスタンス.項目 = nil(@インスタンスの項目に名前が入っていいないと保存されない)
      @user.name = nil
      @user.valid?
      #エラー文としてName can't be blank)が表示される
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")

    end
    it "passwordが6文字以上であれば登録できること" do
      #インスタンス.項目 = "仮置きのため、6文字以上ならOK"
      #１、登録できるか確認する。conrirmationもセットになります
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid

    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password ="123456"
      #ここで上と下の数が不一致になっている
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "重複したemailが存在する場合登録できないこと" do
      #メールアドレスでは違った書き方になる
      #1,@インスタンス.save
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      
    end
  end
end