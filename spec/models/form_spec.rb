require 'rails_helper'

  RSpec.describe Form, type: :model do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
     @form = FactoryBot.build(:form, item_id:@item.id, user_id:@user.id)
     sleep 0.5
    end
  
    describe '商品購入機能' do
      context '商品購入できるとき' do
        it 'post_code, shipping_area_id, city, address, phone_numberがあれば登録できる' do
          expect(@form).to be_valid
        end
        it 'building_nameがなくても登録できる' do
          @form.building_name = ""
          expect(@form).to be_valid
        end
      end

      context '商品購入できないとき' do

        it 'post_codeが半角数字でなければ登録できない' do
          @form.post_code = "３３３ー２１４９"
          @form.valid?
          expect(@form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it 'post_codeにハイフンがなければ登録できない' do
          @form.post_code = "1234567"
          @form.valid?
          expect(@form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it 'shipping_area_idがないと登録できない' do
          @form.shipping_area_id = 0
          @form.valid?
          expect(@form.errors.full_messages).to include("Shipping area must be other than 0")
        end
        it 'cityがなければ登録できない' do
          @form.city = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("City can't be blank")
        end
        it 'addressがないと登録できない' do
          @form.address = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Address can't be blank")
        end
        it 'phone_numberがないと登録できない' do
          @form.phone_number = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが半角数字でないと登録できない' do
          @form.phone_number = "０９０１２３４１２３４"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが英数混合では登録できない' do
          @form.phone_number = "0901234aiue"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが12桁以上では登録できない' do
          @form.phone_number = "090123456789"
          @form.valid?
          expect(@form.errors.full_messages).to include("Phone number is invalid")
        end
        it "tokenが空では登録できないこと" do
          @form.token = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Token can't be blank")
        end
        it "user_idがなければ登録できない" do
          @form.user_id = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("User can't be blank")
        end
        it "item_idがなければ登録できないこと" do
          @form.item_id = nil
          @form.valid?
          expect(@form.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  
end