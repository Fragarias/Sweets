class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end
  def index
    @items = Item.page(params[:page])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end
