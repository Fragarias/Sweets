class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    if params[:name]
      @name = params[:name]
      @items = Item.where(name: @name).page(params[:page])
    elsif params[:genre_id]
      @genre_id = params[:genre_id]
      @items = Item.where(genre_id: @genre_id).page(params[:page])
    else
      @items = Item.all.page(params[:page]).per(8)
    end
  end
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private
  def item_params
    params.require(:items).permit(:name, :introduction, :price, :is_sale)
  end
end
