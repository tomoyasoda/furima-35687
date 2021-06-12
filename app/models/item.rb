class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :item_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title    
    validates :price, numericality:{only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :buy_item_info
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :item_charge_id
      validates :prefecture_id
      validates :shipping_day_id
      end
    end
end
