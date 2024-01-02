class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_item = current_customer.cart_items.all
  end
  def create
  end
end
