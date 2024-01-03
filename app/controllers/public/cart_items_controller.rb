class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0
  end
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    render :index
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
