class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を登録しました。"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end
  def index
    if params[:name]
      @name = params[:name]
      @items = Item.where(name: @name).page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash[:notice] = "編集内容を保存しました。"
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_sale)
  end
end
