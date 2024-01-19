class Public::ItemsController < ApplicationController

  def index
    if params[:name]
      @name = params[:name]
      @items = Item.where(name: @name).page(params[:page])
    else
      @items = Item.all.page(params[:page]).per(8)
    end
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private
  def item_params
    params.require(:items).permit(:name, :introduction, :price, :is_sale)
  end
end
