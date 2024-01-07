class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0
  end
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id #追加したcart_itemのcustomer_idカラムにログインユーザーのidをいれる
    #追加した商品がカート内に存在するかの判別
    if CartItem.find_by(item_id: params[:cart_item][:item_id])
      #存在する #カート内の個数をフォームから送られた個数分追加する
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
    else
      #存在しない #カートモデルにレコードを新規作成する
      @cart_item.save #追加したcart_itemを保存
    end
    redirect_to cart_items_path
  end
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @total_price = 0
    render :index
  end
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
