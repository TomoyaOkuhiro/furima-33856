require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録が正常な場合' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
       expect(@user).to be_valid
      end
    end
   context '新規登録が異常な場合' do
      it 'nicknameが空では登録できないこと' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと登録できないこと' do
       @user.email = "kkkgmail.com"
       @user.valid?
       expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できないこと' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが全角では登録できないこと' do
       @user.password = 'ａａａａ１２'      
       @user.password_confirmation = 'ａａａａ１２'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが半角英数字混合でなければ登録できないこと' do
       @user.password = "aaaaaa"
       @user.password_confirmation = 'aaaaaa'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが数字のみでは登録できないこと' do
       @user.password = "111111"
       @user.password_confirmation = '111111'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが5文字以下であれば登録できないこと' do
       @user.password = 'abc45'
       @user.password_confirmation = 'abc45'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
       @user.password = '123456'
       @user.password_confirmation = '1234567'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'last_nameが空では登録できないこと' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが全角でないと登録できないこと' do
       @user.last_name = 'aiueo'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが全角でないと登録できないこと' do
       @user.first_name = 'kakikukeko'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_name_kanaが空では登録できないこと' do
       @user.last_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できないこと' do
       @user.first_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaがカタカナ以外では登録できないこと' do
       @user.last_name_kana = 'あいうえお'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_name_kanaがカタカナ以外では登録できないこと' do
       @user.first_name_kana = 'あいうえお'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana is invalid")
      end


     it 'birth_dayが空では登録できないこと' do
       @user.birth_day = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end