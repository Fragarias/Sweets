class Public::ShippingsController < ApplicationController
  def index
    @shipping = Shipping.new
    @shippings = current_customer.shippings.all
  end
  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    @shipping.save
    flash[:notice] = "配送先を登録しました。"
    redirect_to shippings_path
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end
  def update
    @shipping = Shipping.find(params[:id])
    @shipping.update(shipping_params)
    flash[:notice] = "編集内容を保存しました。"
    redirect_to shippings_path
  end
  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    flash[:notice] = "配送先を削除しました。"
    redirect_to shippings_path
  end

  private
  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name, :customer_id)
  end
end
