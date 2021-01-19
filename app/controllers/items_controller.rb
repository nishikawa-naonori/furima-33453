class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :redirect_item, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
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
    if @item.update(item_params_update)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :goods, :info, :category_id, :goods_status_id, :delivery_fee_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def item_params_update
    params.require(:item).permit(:image, :goods, :info, :category_id, :goods_status_id, :delivery_fee_id, :prefecture_id,
                                 :delivery_day_id, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_item
    redirect_to action: :index unless current_user == @item.user
  end
end
