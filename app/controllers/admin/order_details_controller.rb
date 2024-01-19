class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @subtotal = 0
    @total_price = 0
  end
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(production_status: params[:order_detail][:production_status])
    order = @order_detail.order
    if params[:order_detail][:production_status] == "in_production" #製作ステータスが一つでも製作中の時
      order.update(status: "in_production") #注文ステータスを製作中に更新
    end
    if is_all_order_details_production_completed(order) #ストロングパラメータ参照(return trueの場合実行)
      order.update(status: "preparing_to_ship") #注文ステータスを発送準備中に更新
    end
    redirect_to admin_order_detail_path(@order_detail.order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
  def is_all_order_details_production_completed(order)
    order.order_details.each do |order_detail| #注文に紐づく注文詳細を一つずつとりだす
      if order_detail.production_status != "production_completed" #取り出した注文詳細が製作完了じゃない
        return false
      end
    end
    return true #全ての注文詳細が製作完了である場合
  end
end
