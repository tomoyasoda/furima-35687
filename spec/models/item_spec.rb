require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '- 商品画像を1枚つけることが必須であること'do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")

    end

    it '- 商品名が必須であること'do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it '- 商品の説明が必須であること'do
      @item.buy_item_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Buy item info can't be blank")
    end

    it '- カテゴリーの情報が必須であること'do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '- 商品の状態についての情報が必須であること'do
      @item.item_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it '- 配送料の負担についての情報が必須であること'do
      @item.item_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item charge can't be blank")
    end

    it '- 発送元の地域についての情報が必須であること'do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '- 発送までの日数についての情報が必須であること'do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it '- 販売価格についての情報が必須であること'do
      @item.price = ''
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



    it '- 販売価格は半角数字のみ保存可能であること'do
      @item.price = '1000000'
      expect(@item).to be_valid
    end

  end

end