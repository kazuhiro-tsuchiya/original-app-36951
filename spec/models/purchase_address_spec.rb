require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '購入情報の保存が問題ない場合' do
      it 'token、post_code、area、city、street、phone_number、quantityがあれば保存ができること' do
        expect(@purchase_address).to be_valid
      end
      it 'build_nameは空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
      it 'sizeは空でも保存できること' do
        @purchase_address.size_id = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '購入情報の保存が問題ある場合' do
      it 'tokenが空では保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'post_codeが空では保存できないこと' do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です。ハイフンを入れてください。")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は不正な値です。ハイフンを入れてください。')
      end
      it 'post_codeが半角数値でないと保存できないこと' do
        @purchase_address.post_code = '１２３-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は不正な値です。ハイフンを入れてください。')
      end
      it 'areaが空では保存できないこと' do
        @purchase_address.area = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空では保存できないこと' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'streetが空では保存できないこと' do
        @purchase_address.street = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberがハイフンを含んでいると保存できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが半角数値でないと保存できないこと' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @purchase_address.phone_number = '012345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'quantityが未選択では保存できないこと' do
        @purchase_address.quantity_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("数量を入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end

