class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string   :title,               null: false, default: ""      
      t.integer  :price,               null: false     
      t.text     :buy_item_info,       null: false     
      t.integer  :category_id,         null: false  
      t.integer  :item_condition_id,   null: false      
      t.integer  :item_charge_id,      null: false       
      t.integer  :prefecture_id,       null: false        
      t.integer  :shipping_day_id,     null: false        
      t.references :user,              foreign_key: true 
      t.timestamps
    end
  end
end
