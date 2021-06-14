FactoryBot.define do
  factory :item do
    title                  {'福沢'}
    price                  {1000}
    buy_item_info          {'福沢諭吉'}
    category_id            {2}
    item_condition_id      {2}
    item_charge_id         {2} 
    prefecture_id          {2}
    shipping_day_id        {2}
    

    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/諭吉.jpeg'), filename: '諭吉.jpeg')
    end

  end
end
