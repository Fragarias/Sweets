class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end
  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    # elsif params[:order][:address_option] == "1"
    #   shipping = Shipping.find(params[:order][:address_id])
    #   @order.postal_code = shipping.postal_code
    #   @order.address = shipping.address
    #   @order.name = shipping.name
    # elsif params[:order][:address_option] == "2"
    #   @order.postal_code = params[:order][:postal_code]
    #   @order.address = params[:order][:address]
    #   @order.name = params[:order][:name]
    end
    render :new
  end
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment, :postage, :payment_method)
  end
end
