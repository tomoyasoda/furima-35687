class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
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
