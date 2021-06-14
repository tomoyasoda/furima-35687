require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '項目が入力できるとき' do
      it '- 正しい値が入力されていれば保存可能であること'do
      expect(@item).to be_valid
      end

      it '- 販売価格は半角数字のみ保存可能であること'do
      @item.price = '1000000'
      expect(@item).to be_valid
      end
    end

    context '項目が入力でない時' do
      it '- 商品画像を1枚つけることが必須であること'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end

      it '- 商品名が必須であること'do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '- 商品の説明が必須であること'do
        @item.buy_item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Buy item info can't be blank")
      end

      it '- カテゴリーの情報が必須であること'do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '- 商品の状態についての情報が必須であること'do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end

      it '- 配送料の負担についての情報が必須であること'do
        @item.item_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item charge must be other than 1")
      end

      it '- 発送元の地域についての情報が必須であること'do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '- 発送までの日数についての情報が必須であること'do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it '- 販売価格についての情報が必須であること'do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '- 販売価格は、¥300以下では保存できないこと'do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '- 販売価格は、¥999,999,999以上では保存できないこと'do
      @item.price = 1000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '- 販売価格が全角文字では保存できないこと'do
      @item.price = "ほげほげ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '- 販売価格が半角英数混合では保存できないこと'do
      @item.price = "000aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '- 販売価格が半角英語だけでは保存できないこと'do
      @item.price = "aaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end


    end
  end

end