class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.all
  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details.all
    if @order.status == "payment_confirmed" #注文ステータスが入金確認な場合
      @order_details.update_all(production_status: "waiting_for_production") #製作ステータスを製作待ちに更新
    end
    redirect_to admin_order_detail_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
