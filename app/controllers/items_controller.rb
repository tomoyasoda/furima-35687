class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:title,:price,:buy_item_info,:category_id,:item_condition_id,:item_charge_id,:prefecture_id,:shipping_day_id,:image).merge(user_id: current_user.id)
  end

end
