class MarketsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :only_buyer, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: :DESC)
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
       render:edit
    end
  end

  def destroy
    if @item.destroy
     redirect_to root_path
  else
     redirect_to root_path
    end
  end
  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def only_buyer
    redirect_to root_path unless current_user.id == @item.user_id
  end
end 