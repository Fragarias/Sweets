class Public::ShippingsController < ApplicationController
  def index
    @shipp = Shipping.new
    @shipps = Shipping.all
  end
  def create
    @shipp = Shipping.new(shipping_params)
    @shipp.save
  end

  def edit
    @shipp = Shipping.find(params[:id])
  end
  def update
    @shipp = Shipping.find(params[:id])
    @shipp.update(shipping_params)
  end
  def destroy
    @shipp = Shipping.find(params[:id])
  end

  private
  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name, :customer_id)
  end
end
