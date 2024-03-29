require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる時' do
      it '必要事項を全て入力すると登録できる' do
        expect(@item).to be_valid
      end
      # it '商品画像が存在すれば登録できる' do
        # @item.image = 
        # @item.valid?
      # end
      it '商品名が存在すれば登録できる' do
        @item.name = 'aaa'
        expect(@item).to be_valid
      end
      it '商品の説明が存在すれば登録できる' do
        @item.info = 'aaaaa'
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @item.item_status_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @item.shipping_fee_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @item.scheduled_delivery_id = 1
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
  
    context '商品の出品ができないとき' do
      it '１枚画像がないと出品できない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '商品画像を入力してください'
      end
      it '商品名が空欄だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名を入力してください'
      end
      it '商品の説明が空欄だと出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の説明を入力してください'
      end
      it 'カテゴリーが「---」だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Categoryを入力してください'
      end
      it '商品の状態が「---」だと出品できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item statusを入力してください'
      end
      it '配送料の負担が「---」だと出品できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping feeを入力してください'
      end
      it '発送元の地域が「---」だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefectureを入力してください'
      end
      it '発送までの日数が「---」だと出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled deliveryを入力してください'
      end
      it '価格が空欄だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '価格を入力してください'
      end
      it '価格が全角だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は300以上の値にしてください'
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は9999999以下の値にしてください'
      end
      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
