class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index,:create]
  before_action :sold_out, only:[:index,:create]
  
  def index
    @purchase = Form.new

  end

  def create
    @purchase = Form.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def purchase_params
    params.require(:form).permit(:purchase_management, :post_code, :phone_number, :shipping_area_id, :city, :address, :building_name).merge(user_id: current_user.id,item_id: params[:market_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:market_id])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

    
  def sold_out
    if current_user.id == @item.user_id || @item.purchase_management.present?
      redirect_to root_path
    end
  end

  

end
