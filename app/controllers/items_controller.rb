class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :contributor_confirmation, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]




  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end


  def update
    if @item.update(item_params)
      redirect_to root_path 
    else
      render :edit
    end
  end


  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:title,:price,:buy_item_info,:category_id,:item_condition_id,:item_charge_id,:prefecture_id,:shipping_day_id,:image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @item.user_id 
  end

end
